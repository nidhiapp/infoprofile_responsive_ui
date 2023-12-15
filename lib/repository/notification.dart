import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:info_profile_ui/models/notification_model.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/keys.dart';

final storeNotificationRef =
    FirebaseFirestore.instance.collection(FirebaseKey.notificationKey);
final storeUserNotificationRef =
    FirebaseFirestore.instance.collection(FirebaseKey.userNotification);

Stream<List<ApiNotification?>> getOwnNotification() async* {
  debugPrint("Get Own Notification Api Called");
  String userId = FirebaseAuth.instance.currentUser!.uid;
  final notificationsSnap = storeUserNotificationRef.doc(userId).snapshots();

  await for (final event in notificationsSnap) {
    debugPrint("Notification Data is ${event.data()}");
    final notificationList = NotificationList.fromJson(event.data()!);
   // List<ApiNotification?> noti = [];
    for (int i = 0; i < notificationList.notificationIds!.length; ++i) {
      final notificationDetails = getNotificationDetails(
          notificationId: notificationList.notificationIds![i]);
    }
  }
}

Stream<NotificationListModel?> getNotification() {
  String id = FirebaseAuth.instance.currentUser!.uid;
  final notification = storeUserNotificationRef.doc(id).snapshots();
  return notification.map((event) {
    debugPrint("notifications are__________________________ ${event.data()}");
    NotificationListModel? model;
    try {
      model = NotificationListModel.fromJson(event.data()!);
    } catch (e) {
      debugPrint("Error while conversion of notification error:$e");
    }
    return model;
  });
}


Stream<ApiNotification?> getNotificationDetails(
    {required String notificationId}) {
  debugPrint("Notification details of $notificationId");
  final notificationDetail =
      storeNotificationRef.doc(notificationId).snapshots();

  return notificationDetail.map((event) {
    ApiNotification? notification;
    try {
      notification = ApiNotification.fromJson(json: event.data()!);
    } catch (e) {
      debugPrint("Error while converting notification");
    }
    return notification;
  });

 
}

deleteMyNotification({required String notificationId}) async {

  await storeNotificationRef.doc(notificationId).delete();
}
