import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/models/comment_model.dart';
import 'package:info_profile_ui/models/notification_model.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';

class CommentController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFeedRepo  _api = FirebaseFeedRepo ();

  Future addComment(
      {required String comment,
      required String postId,
      bool isReplied = false,
      required String postedBy}) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String userId = _auth.currentUser!.uid;
    bool isAdded = false;
    await _api
        .commentOnPost(
            comment: Comment(
                id: time + userId,
                comment: comment,
                time: time,
                postId: postId,
                commentedBy: userId,
                isEdited: false,
                isReplied: isReplied,
                isVisible: true,
                replies: [],
                report: []))
        .then((value) {
      debugPrint("Comment Added Successfully");
      isAdded = true;
    }).onError((error, stackTrace) {
      debugPrint("Error in Adding Comment $error");
    });
    if (isAdded) {
      await _api
          .sendNotification(ApiNotification(
              time: time,
              id: time + userId,
              sentToId: postedBy,
              sentByUsername: "",
              sentByName: "",
              sentByImage: "",
              sentById: userId,
              message: "Created Comment on your post ",
              type: NotificationTypes.comment,
              activityId: postId))
          .then((value) {
        debugPrint("Notification Added Successfully");
      }).onError((error, stackTrace) {
        debugPrint("Error in Adding Notification on Comment $error");
      });
    }
  }

  Stream<PostCommentListModel?> getFeedCommentList({required String postId}) {
    return _api.getPostCommentList(postId: postId);
  }
}
