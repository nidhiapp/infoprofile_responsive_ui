import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/models/notification_model.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/enums.dart';

class LikeDislikeApis {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFeedRepo  _api = FirebaseFeedRepo ();

  addLike({required String postId, required String postedBy,}) async {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    String userId = _auth.currentUser!.uid;
    bool isAdded = false;
    await _api.likePost(postId: postId, postedById: _auth.currentUser!.uid).then((value){
      debugPrint("Like Added Successfully");
    
      isAdded = true;
    }).onError((error, stackTrace){
      debugPrint("Error on Adding Like");
    });
    if(isAdded){
      await _api.sendNotification(ApiNotification(time: time, id: time+userId, sentToId: postedBy, sentByUsername: "", sentByName: "", sentByImage: "", sentById: userId, message: "Liked your post ", type: NotificationType.like, activityId: postId)).then((value){
        debugPrint("Notification Added Successfully for like");
      }).onError((error, stackTrace){
        debugPrint("Error in Adding Notification on like $error");
      });
    }
  }

  addDisLike({required String postId}) async {
    await _api.dislikePost(postId: postId, postedById: _auth.currentUser!.uid).then((value){
      debugPrint("DisLike Added Successfully");
    }).onError((error, stackTrace){
      debugPrint("Error on Adding DisLike");
    });
  }
}