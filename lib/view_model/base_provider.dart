import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:info_profile_ui/models/comment_model.dart';
import 'package:info_profile_ui/models/user_post_model.dart';
import 'package:info_profile_ui/models/user_profile.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_toast.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/keys.dart';

class BaseProvider extends ChangeNotifier {
  final storeRef = FirebaseFirestore.instance.collection(FirebaseKey.userKey);
  TextEditingController postDescriptionController = TextEditingController();
  TextEditingController updateCont = TextEditingController();

  String? desc;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool val) {
    _loading = val;
    notifyListeners();
  }

  bool isPicked = false;

  File? _pickedImage;
  get pickedImage => _pickedImage;
  Uint8List? webImage = Uint8List(8);

  final FirebaseFeedRepo _api = FirebaseFeedRepo();

  void pickImageFromDevice() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      var webSelectedImageBytes = await image.readAsBytes();
      webImage = webSelectedImageBytes;
      _pickedImage = File('a');
      // debugPrint("Image Picked path is ----> ${webImage}");
      isPicked = true;
      notifyListeners();
    } else {
      isPicked = false;
    }
  }

  // String? _imgUrl =
  //     "https://www.pmindia.gov.in/wp-content/uploads/2022/12/Modi-Ji-Photo-02-e1647325936821.jpg";
  // String get imgUrl => _imgUrl!;

  // Future<PermissionStatus?> requestPermission() async {
  //   PermissionStatus status = await Permission.camera.request();
  //   return status;
  // }

  Future<String?> uploadImage() async {
    String? imagePath;
    if (!isPicked) {
      debugPrint("Image not Picked");
      return null;
    } else {
      await _api.uploadPostImageFile(webImage!).then((image) {
        debugPrint("Image has been uploaded Url: $imagePath");
        imagePath = image;
      }).onError((error, stackTrace) {
        debugPrint("Error while uploading image $error");
        resetImage();
      });
    }
    debugPrint("Image Uploaded");
    return imagePath;
  }

  Future createPost() async {
  //  setLoading(true);
    if (loading ||
        (postDescriptionController.text.toString().trim().isEmpty &&
            !isPicked)) {
      debugPrint(
          "Returning because image is not picked $isPicked and description is ${postDescriptionController.text.toString().trim()} and loading is $loading");
      resetImage();
      return;
    }

    debugPrint(
        "Values are isPicked: $isPicked, desc: ${postDescriptionController.text.toString().trim()} , loading is $loading");
    setLoading(true);

    String? url;
    debugPrint("Going to post");
    if (isPicked) {
      debugPrint("Image is picked going to upload");
      url = await uploadImage();
      debugPrint("Image url is $url");
    }
    debugPrint("< Image Uploaded of post >");
    String? postId;
    await uploadPostInTable(isPicked ? url! : "").then((value) {
      postId = value;
      debugPrint("Image Uploaded of post $postId");
    }).onError((error, stackTrace) {
      debugPrint("Image Uploaded of post error:$error");
      resetImage();
    });
    debugPrint(" Uploaded in post table");
    await updateInUserProfile(postId!).then((value) {
      if (value == true) {
        debugPrint("Post Uploaded SuccessFully in user table");
        postDescriptionController.text = "";
      }
    }).onError((error, stackTrace) {
      debugPrint("Image updateInUserProfile error of post $error");
      resetImage();
    });
    resetImage();
    setLoading(false);
  }

  Future<String?> uploadPostInTable(String? url) async {
    debugPrint("Uploading Post in Post table");
    String? postId;
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String description = postDescriptionController.text.toString().trim();
    debugPrint("Uploading Post in Post table");
    await _api
        .uploadPost(PostModel(
            postId: _auth.currentUser!.uid + time,
            time: time,
            description: description,
            postedBy: _auth.currentUser!.uid,
            likeList: [],
            commentIdList: [],
            imageLink: isPicked ? url : "",
            userProfileImage:
                _auth.currentUser?.photoURL ?? AppLink.defaultFemaleImg,
            username: _auth.currentUser!.uid,
            visibility: 1,
            noOfBlocks: 0,
            lastComment: "",
            lastCommentedById: "",
            lastCommentedByName: "",
            lastCommentByImage: ""))
        .then((value) {
      postId = value;
    }).onError((error, stackTrace) {
      debugPrint("Error in Upload Post in Post table $error");
    });
    return postId;
  }

  Future<bool?> updateInUserProfile(String postId) async {
    bool? res;
    await _api.updatePostInProfile(postId).then((value) {
      res = value;
    });
    return res;
  }

  void resetImage() {
    isPicked = false;
    webImage = null;
    _pickedImage = null;
    setLoading(false);
    notifyListeners();
  }

  Future followUser(String uId) async {
    debugPrint("Follow user Called");
    bool? res;
    await _api.followUser(uId).then((value) {
      res = true;
      debugPrint("User Has Been Followed $value");
    }).onError((error, stackTrace) {
      res = false;
    });
    return res;
  }

  Stream<UserProfileModel?> getFollower(String uid) {
    return _api.getUserData(id: uid);
  }

  Stream<UserProfileModel?> getFollowing(String uid) {
    return _api.getUserData(id: uid);
  }

  Future unFollowUser(String id) async {
    debugPrint("Unfollow called for $id");
    await _api.unFollowUser(id).then((value) {
      if (value == true) {
        // debugPrint("User has been unfollowed $id");
      } else {
        // debugPrint("Unable to unfollow user $id");
      }
    }).onError((error, stackTrace) {});
  }

  Stream<UserProfileModel?> getUserProfile(String id) {
    return _api.getUserData(id: id);
  }

  Stream<List<PostModel?>> getUserFeed() {
    return _api.getUserFeedWithDetails();
  }

  removeFollower({required String uid}) async {
    String id = _auth.currentUser!.uid;
    storeRef.doc(uid).update({
      'followingList': FieldValue.arrayRemove([id])
    });
    storeRef.doc(id).update({
      'followerList': FieldValue.arrayRemove([uid])
    });
  }

  Future<void> editComment(
      Comment comment, BuildContext context, String? prevComment) async {
    bool? isPreEdited = comment.isEdited;
    try {
      CollectionReference commentsCollection =
          FirebaseFirestore.instance.collection('comment');
      comment.isEdited = true;
      await commentsCollection.doc(comment.postId).update({
        'postCommentList': FieldValue.arrayUnion([comment.toJson()]),
      }).then((value) {
        notifyListeners();
        CustomToast(context: context, message: "Comment edited successfully");
      });
      comment.isEdited = isPreEdited;
      comment.comment = prevComment;
      await commentsCollection.doc(comment.postId).update({
        'postCommentList': FieldValue.arrayRemove([comment.toJson()]),
      }).then((value) {
          notifyListeners();
        CustomToast(context: context, message: "Comment edited successfully");
      });

      debugPrint('Comment ${comment.toJson()} successfully edited');
    } catch (error) {
      debugPrint('Error editing comment: $error');
    }
  }

  Future<void> editPost(
      PostModel des, BuildContext context, String? prevdes) async {
    // bool? isPreEdited = comment.isEdited;
    try {
      CollectionReference postsCollection =
          FirebaseFirestore.instance.collection('post');
      // comment.isEdited = true;
      await postsCollection.doc(des.postId).update({
        'description': des.description,
        
      }).then((value) {
        notifyListeners();
        CustomToast(context: context, message: "post edited successfully");
      });
       notifyListeners();

      debugPrint('description ${des} successfully edited');
    } catch (error) {
      debugPrint('Error editing post: $error');
    }
  }
}
