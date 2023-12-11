import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:info_profile_ui/models/comment_model.dart';
import 'package:info_profile_ui/models/notification_model.dart';
import 'package:info_profile_ui/models/post_like.dart';
import 'package:info_profile_ui/models/user_post_model.dart';
import 'package:info_profile_ui/models/user_profile.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/enums.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/keys.dart';

class FirebaseFeedApi {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final storePostRef =
      FirebaseFirestore.instance.collection(FirebaseKey.postKey);
  final storeUserRef =
      FirebaseFirestore.instance.collection(FirebaseKey.userKey);
  final storeReportPostRef =
      FirebaseFirestore.instance.collection(FirebaseKey.reportPostKey);
  final storeReportCommentRef =
      FirebaseFirestore.instance.collection(FirebaseKey.reportCommentKey);
  final storeCommentRef =
      FirebaseFirestore.instance.collection(FirebaseKey.commentKey);
  final storeLikeRef =
      FirebaseFirestore.instance.collection(FirebaseKey.likeKey);
  final storeNotificationRef =
      FirebaseFirestore.instance.collection(FirebaseKey.notificationKey);
  final storeUserNotificationRef =
      FirebaseFirestore.instance.collection(FirebaseKey.userNotification);

  Future likeOnPost(
      {required String postId, required String postedById}) async {
    final postLikeList = await storePostRef.doc(postId).get();
    bool isAdded = false;
    if (postLikeList.exists) {
      // To map method will add the userId in the likes list and return an updated List in map
      await storePostRef.doc(postId).update({
        'likeList': FieldValue.arrayUnion([postedById]),
      }).then((value) {
        debugPrint("Like added Successfully");
        isAdded = true;
      }).onError((error, stackTrace) {
        debugPrint("Error while updating like in post $error");
        isAdded = false;
      });
      // debugPrint("${postLikeList.data()}");
    } else {
      debugPrint(
          "Either first time like or Error while getting the likes list ${postLikeList.reference}");
      await storePostRef.doc(postId).set({
        'postLikeList': FieldValue.arrayUnion([postedById]),
      }).then((value) {
        debugPrint("Like added Successfully");
        isAdded = true;
      }).onError((error, stackTrace) {
        debugPrint("Error while updating like in post $error");
        isAdded = false;
      });
    }

    if (isAdded) {
      addLikeInLikeTable(postId: postId, likedById: _auth.currentUser!.uid);
    }
  }

  reportOnPost({required String postId, required String reportedById}) async {
    bool isReported = false;
    await storeReportPostRef
        .doc(postId)
        .set({
          'reportPostList': FieldValue.arrayUnion([reportedById])
        })
        .then((value) {})
        .onError((error, stackTrace) {});
  }

  reportOnComment(
      {required String commentId, required String reportedById}) async {
    await storeReportCommentRef.doc(commentId).set({
      'reportCommentList': FieldValue.arrayUnion([reportedById])
    });
  }

  addLikeInLikeTable(
      {required String postId, required String likedById}) async {
    final likeSnaps = await storeLikeRef.doc(postId).get();
    if (likeSnaps.exists) {
      await storeLikeRef.doc(postId).update({
        'likeList': FieldValue.arrayUnion([likedById])
      });
    } else {
      await storeLikeRef.doc(postId).set({
        'likeList': FieldValue.arrayUnion([likedById])
      });
    }
  }

  Future dislikeOnPost(
      {required String postId, required String postedById}) async {
    final postLikeList = await storePostRef.doc(postId).get();
    bool isDisliked = false;
    if (postLikeList.exists) {
      // To map method will add the userId in the likes list and return an updated List in map
      await storePostRef.doc(postId).update({
        'postLikeList': FieldValue.arrayRemove([postedById]),
      }).then((value) {
        debugPrint("Like Removed Successfully");
        isDisliked = true;
      }).onError((error, stackTrace) {
        debugPrint("Error while updating like in post $error");
      });
      // debugPrint("${postLikeList.data()}");
    } else {
      debugPrint(
          "Error while getting the likes list ${postLikeList.reference}");
    }
    if (isDisliked) {
      deleteLikeInLikeTable(postId: postId, likedById: _auth.currentUser!.uid);
    }
  }

  deleteLikeInLikeTable(
      {required String postId, required String likedById}) async {
    final likeSnaps = await storeLikeRef.doc(postId).get();
    if (likeSnaps.exists) {
      await storeLikeRef.doc(postId).update({
        'likeList': FieldValue.arrayRemove([likedById])
      });
    } else {
      await storeLikeRef.doc(postId).set({
        'likeList': FieldValue.arrayRemove([likedById])
      });
    }
  }

  Future commentOnPost({required Comment comment}) async {
    final commentList = await getCommentSnap(comment.postId!);
    bool isCommentAdded = false;
    if (commentList.exists) {
      // debugPrint("Likes list is $likes");
      await storeCommentRef.doc(comment.postId).update({
        'postCommentList': FieldValue.arrayUnion([comment.toJson()])
      }).then((value) {
        // debugPrint("Post Updated SuccessFully");
        isCommentAdded = true;
      }).onError((error, stackTrace) {
        // debugPrint("Error while updating like in post");
      });
      if (isCommentAdded) {
        await updateLastCommentOnPost(
            postId: comment.postId!,
            time: comment.time!,
            commentedById: comment.commentedBy!,
            lastComment: comment.comment!);
        await storePostRef.doc(comment.postId).update({
          'commentList': FieldValue.arrayUnion([comment.toJson()])
        });
      }
      debugPrint("${commentList.data()}");
    } else {
      debugPrint("Either it is a first comment or comment table not exist");
      await storeCommentRef.doc(comment.postId).set({
        'postCommentList': FieldValue.arrayUnion([comment.toJson()])
      }).then((value) {
        debugPrint("Comment Updated SuccessFully");
        isCommentAdded = true;
      }).onError((error, stackTrace) {
        debugPrint("Error while updating comment in post");
      });

      if (isCommentAdded) {
        await updateLastCommentOnPost(
            postId: comment.postId!,
            time: comment.time!,
            commentedById: comment.commentedBy!,
            lastComment: comment.comment!);
        await storePostRef.doc(comment.postId).update({
          'commentList': FieldValue.arrayUnion([comment.toJson()])
        });
      }
    }
  }

  Future updateLastCommentOnPost(
      {required String postId,
      required String commentedById,
      required String lastComment,
      required String time}) async {
    await storePostRef.doc(postId).update({
      'lastComment': lastComment,
      'lastCommentedById': commentedById,
      'lastCommentedByName': time
    }).then((value) {
      debugPrint("Updated Last comment on Post $postId");
    }).onError((error, stackTrace) {
      debugPrint(
          "Error in Update Last comment on Post $postId error is $error");
    });
  }

  getCommentSnap(String postId) async {
    final commentList = await storeCommentRef.doc(postId).get();
    return commentList;
  }

  Future<String?> uploadPostImageFile(Uint8List? pickedImage) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    String timeId = DateTime.now().microsecondsSinceEpoch.toString();
    debugPrint("Upload Image api called");
    Reference ref = FirebaseStorage.instance.ref('/post_images/$uid/$timeId');
    String? imgUrl;
    await uploadFileWithReference(ref, pickedImage).then((value) {
      imgUrl = value;
    }).onError((error, stackTrace) {
      debugPrint("Error Occurs while upload Image error is $error");
    });
    debugPrint("Received Image url is $imgUrl");
    return imgUrl;
  }

  Future<String?> uploadProfileImage(Uint8List? pickedImage) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    debugPrint("Upload Profile Image api called");
    Reference ref = FirebaseStorage.instance.ref('/profile_image/$uid');
    return await uploadFileWithReference(ref, pickedImage);
  }

  // Upload image on given reference and image link will be return
  Future<String?> uploadFileWithReference(
      Reference ref, Uint8List? pickedImage) async {
    debugPrint("Uploading image with reference");
    UploadTask task = ref.putData(pickedImage!);
    return await (await task).ref.getDownloadURL();
  }

  Future<String?> uploadPost(PostModel model) async {
    String? postId;
    await storePostRef.doc(model.postId).set(model.toMap()).then((value) {
      postId = model.postedBy! + model.time.toString();
      debugPrint(
          "Post Uploaded ${model.toMap().toString()} ---------------------------------");
    }).onError((error, stackTrace) {});

    return postId;
  }

  Future<bool?> updatePostInProfile(String postId) async {
    final userDoc = await storeUserRef.doc(_auth.currentUser!.uid).get();
    bool? res = false;
    if (userDoc.exists) {
      var doc = userDoc.data() as Map<String, dynamic>;
      UserProfileModel userProfileModel = UserProfileModel.fromJson(doc);
      userProfileModel.postList!.add(postId);
      await storeUserRef
          .doc(_auth.currentUser!.uid)
          .update({'postList': userProfileModel.postList!}).then((value) {
        res = true;
      }).onError((error, stackTrace) {});
    }
    return res;
  }

  Future<bool?> updateNameInProfile(String newName) async {
    bool? res = false;
    await storeUserRef
        .doc(_auth.currentUser!.uid)
        .update({"name": newName}).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

  Future<bool?> updateImageInProfile(String newImage) async {
    bool? res = false;
    await storeUserRef
        .doc(_auth.currentUser!.uid)
        .update({"image": newImage}).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

  Future<bool?> updateMobileInProfile(String newMobile) async {
    bool? res = false;
    await storeUserRef
        .doc(_auth.currentUser!.uid)
        .update({"mobile": newMobile}).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

  Future<bool?> updateGenderInProfile(String newGender) async {
    bool? res = false;
    await storeUserRef
        .doc(_auth.currentUser!.uid)
        .update({"gender": newGender}).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

  Future<bool?> updateEmailInProfile(String newEmail) async {
    bool? res = false;
    await storeUserRef
        .doc(_auth.currentUser!.uid)
        .update({"email": newEmail}).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

  Future<bool?> updateUsernameInProfile(String newUsername) async {
    bool? res = false;
    await storeUserRef
        .doc(_auth.currentUser!.uid)
        .update({"username": newUsername}).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

  Future<bool?> followUser(String followingId) async {
    debugPrint("Going to Follow user $followingId");
    if (followingId == _auth.currentUser!.uid) return false;

    try {
      final currentUserDoc =
          await storeUserRef.doc(_auth.currentUser!.uid).get();
      final followingUserDoc = await storeUserRef.doc(followingId).get();

      if (currentUserDoc.exists && followingUserDoc.exists) {
        var currentUserData = currentUserDoc.data() as Map<String, dynamic>;
        var followingUserData = followingUserDoc.data() as Map<String, dynamic>;

        UserProfileModel currentUserProfile =
            UserProfileModel.fromJson(currentUserData);
        UserProfileModel followingUserProfile =
            UserProfileModel.fromJson(followingUserData);

        List<String> followingList = [...currentUserProfile.followingList!];
        List<String> followerList = [...followingUserProfile.followerList!];

        // Check if the current user is already following the user
        if (followingList.contains(followingId)) {
          debugPrint("Already Followed");
          return false;
        }

        followingList.add(followingId);
        await storeUserRef
            .doc(_auth.currentUser!.uid)
            .update({'followingList': followingList});

        // Check if the user is already in the follower list of the following user
        if (!followerList.contains(_auth.currentUser!.uid)) {
          followerList.add(_auth.currentUser!.uid);
          await storeUserRef
              .doc(followingId)
              .update({'followerList': followerList});
        }

        String time = DateTime.now().millisecondsSinceEpoch.toString();

        // Sending Notification
        debugPrint(
            "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Going to send Notification%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
        await sendNotification(
          ApiNotification(
            type: NotificationType.follow,
            id: time + followingId,
            message: "You are being followed by ",
            sentById: _auth.currentUser!.uid,
            sentByImage: "",
            activityId: _auth.currentUser!.uid,
            sentByName: _auth.currentUser!.displayName,
            sentByUsername: _auth.currentUser!.displayName,
            sentToId: followingId,
            time: time,
          ),
        );

        return true;
      } else {
        return false; // Handle the case where one of the documents doesn't exist
      }
    } catch (error) {
      if (kDebugMode) {
        print('Error in following user: $error');
      }
      return false; // Return false in case of any error
    }
  }

  Stream<UserProfileModel?> getUserData({String? id}) {
    String uid = id ?? _auth.currentUser!.uid;
    final followerStream = storeUserRef.doc(uid).snapshots();
    return followerStream
        .map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      // debugPrint("${snapshot.data()} is the response of get follower stream");
      UserProfileModel userProfileModel =
          UserProfileModel.fromJson(snapshot.data() as Map<String, dynamic>);
      return userProfileModel;
    });
  }

  Future<bool?> unFollowUser(String followingId) async {
    if (followingId == _auth.currentUser!.uid) return false;

    try {
      final currentUserDoc =
          await storeUserRef.doc(_auth.currentUser!.uid).get();
      final followingUserDoc = await storeUserRef.doc(followingId).get();

      if (currentUserDoc.exists && followingUserDoc.exists) {
        var currentUserData = currentUserDoc.data() as Map<String, dynamic>;
        var followingUserData = followingUserDoc.data() as Map<String, dynamic>;

        UserProfileModel currentUserProfile =
            UserProfileModel.fromJson(currentUserData);
        UserProfileModel followingUserProfile =
            UserProfileModel.fromJson(followingUserData);

        // Update the current user's followingList
        currentUserProfile.followingList!
            .removeWhere((id) => id == followingId);
        await storeUserRef
            .doc(_auth.currentUser!.uid)
            .update({'followingList': currentUserProfile.followingList});

        // Update the following user's followerList
        followingUserProfile.followerList!
            .removeWhere((id) => id == _auth.currentUser!.uid);
        await storeUserRef
            .doc(followingId)
            .update({'followerList': followingUserProfile.followerList});

        return true;
      } else {
        return false; // Handle the case where one of the documents doesn't exist
      }
    } catch (error) {
      debugPrint('Error in unfollowing user: $error');
      return false; // Return false in case of any error
    }
  }

 

  Stream<PostModel?> getCurrentPostDetails(String postId) {
    final postSnapshots = storePostRef.doc(postId).snapshots();
    return postSnapshots.map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      PostModel post =
          PostModel.fromJson(snapshot.data() as Map<String, dynamic>);
      return post;
    });
  }

  Stream<List<PostModel>> getUserFeedWithDetails() {
    String uid = _auth.currentUser!.uid;
    debugPrint("User's uid is $uid");
    final followerStream = storeUserRef.doc(uid).snapshots();
    debugPrint("Fetching followerStream for user: $uid");

    return followerStream
        .asyncMap((DocumentSnapshot<Map<String, dynamic>> snapshot) async {
      debugPrint("Fetching for data ${snapshot.data()}");
      UserProfileModel userProfileModel =
          UserProfileModel.fromJson(snapshot.data()!);
      debugPrint(
          "Fetched following ids: ${userProfileModel.followingList!.length}");
      // debugPrint("Following ids are: ${userProfileModel.followingList}");

      List<PostModel> posts = [];
      List<String> postIdList = [];
      if (userProfileModel.postList!.isNotEmpty) {
        postIdList.addAll(userProfileModel.postList!);
      }
      debugPrint("Fetched post ids are $postIdList");

      for (String followingId in userProfileModel.followingList ?? []) {
        final followingsSnapshot = await storeUserRef.doc(followingId).get();
        if (followingsSnapshot.exists) {
          UserProfileModel followingUserProfile =
              UserProfileModel.fromJson(followingsSnapshot.data()!);
          debugPrint("Fetching posts for user: $followingId");

          if (followingUserProfile.postList!.isNotEmpty) {
            postIdList.addAll(followingUserProfile.postList!);
          }
        } else {
          debugPrint(
              "Error in followingsSnapshot ${followingsSnapshot.reference}");
        }
      }
      try {
        for (String postId in postIdList) {
          debugPrint("Fetching details of postId $postId");
          final postSnapshot = await storePostRef.doc(postId).get();
          if (postSnapshot.exists) {
            // debugPrint( "Fetched Post Details for user $followingId, post ID $postId are ${postSnapshot.data()!}");
            try {
              PostModel thisPost = PostModel.fromJson(postSnapshot.data()!);
              if (posts.isNotEmpty) {
                posts.add(thisPost);
                debugPrint("Post Added!");
              } else {
                posts = [thisPost];
              }
            } catch (e) {
              debugPrint("Error in adding data $e");
            }
          } else {
            debugPrint(
                'Error during fetching feed data ${postSnapshot.data()}');
          }
        }
      } catch (e) {
        debugPrint("Error While Fetching post $e");
      }
      // debugPrint("Fetched ${posts.length} posts");
      posts.sort((a, b) {
        int aTime = int.parse(a.time!);
        int bTime = int.parse(b.time!);
        return aTime >= bTime ? 0 : 1; // For descending order (latest first)
        // For ascending order (oldest first): return timeA.compareTo(timeB);
      });
      return posts;
    });
  }

  Future sendNotification(ApiNotification notification) async {
    // Adding Notification in the Notification Table
    await storeNotificationRef.doc(notification.id).set(notification.toMap());

    // Getting the List of Notification of the user
    final notificationSnaps = await getNotification(notification.sentToId!);
    if (notificationSnaps.exists) {
      final notifications = notificationSnaps.data() as Map<String, dynamic>;
      NotificationList notificationList =
          NotificationList.fromJson(notifications);
      notificationList.notificationIds!.add(notification.id!);
      await storeUserNotificationRef
          .doc(notification.sentToId)
          .update({'notificationIds': notificationList.notificationIds!});
    } else {
      await storeUserNotificationRef.doc(notification.sentToId).set({
        'notificationIds': [notification.id!]
      });
    }
  }

  Future getNotification(String userId) async {
    final notification = await storeUserNotificationRef.doc(userId).get();
    return notification;
  }

  Future<List<UserProfileModel>> searchUsers(String searchText) async {
    // Convert the searchText to lowercase for case-insensitive search
    debugPrint("Searching for $searchText");
    String searchTextLower = searchText;

    try {
      // Use FireStore query to search for users with matching usernames
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await storeUserRef
          .orderBy('name')
          .startAt([searchTextLower]).endAt([
        '$searchTextLower\uf8ff'
      ]) // '\uf8ff' is a Unicode character higher than any letter
          .get();

      // Convert query results to a list of UserProfileModel
      List<UserProfileModel> users = querySnapshot.docs.map((doc) {
        debugPrint("Search Result is ${doc.data()}");
        return UserProfileModel.fromJson(doc.data()!);
      }).toList();
      // await followUser(users[0].uid.toString());
      return users;
    } catch (error) {
      if (kDebugMode) {
        print('Error searching users: $error');
      }
      // Handle the error as needed
      return [];
    }
  }

  Stream<PostCommentListModel?> getPostCommentList({required String postId}) {
    final commentStream = storeCommentRef.doc(postId).snapshots();
    return commentStream.map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      // debugPrint("Data is ${snapshot.data()}");
      PostCommentListModel postCommentListModel =
          PostCommentListModel.fromJson(snapshot.data()!);
      return postCommentListModel;
    });
  }

  Stream<PostLikeModel?> getPostLikeList({required String postId}) {
    final commentStream = storeLikeRef.doc(postId).snapshots();
    return commentStream.map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      debugPrint("Data of Like is ${snapshot.data()}");
      PostLikeModel model = PostLikeModel.fromJson(snapshot.data()!);
      return model;
    });
  }

  updateProfileData({required String name, required String username, required String gender, required String dob, required String about, required String mobile, required String email}) async {
    String uid = _auth.currentUser!.uid;
    await storeUserRef.doc(uid).update({'name': name, 'username':username, 'gender': gender, 'dob': dob, 'about': about, 'mobile': mobile, 'email': email});
  }


 
}
