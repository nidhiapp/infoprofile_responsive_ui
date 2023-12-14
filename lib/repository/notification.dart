import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:info_profile_ui/models/notification_model.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/keys.dart';
final storeNotificationRef = FirebaseFirestore.instance.collection(FirebaseKey.notificationKey);
  final storeUserNotificationRef = FirebaseFirestore.instance.collection(FirebaseKey.userNotification);
Stream<List<ApiNotification?>> getOwnNotification() async* {
    debugPrint("Get Own Notification Api Called");
    String userId = FirebaseAuth.instance.currentUser!.uid;
    final notificationsSnap = storeUserNotificationRef.doc(userId).snapshots();

    await for (final event in notificationsSnap) {
      debugPrint("Notification Data is ${event.data()}");
      final notificationList = NotificationList.fromJson(event.data()!);
      List<ApiNotification?> noti = [];
      for (int i = 0; i < notificationList.notificationIds!.length; ++i) {
        final notificationDetails = await getNotificationDetails(notificationId: notificationList.notificationIds![i]);
        noti.add(notificationDetails); // Assuming notificationDetails is a Map
        yield noti; // Yield the updated notification list
      }
    }
  }

  // Future<ApiNotification?> getNotificationDetails({required String notificationId}) async {
  //   debugPrint("Notification details of $notificationId");
  //   final notificationDetail = storeNotificationRef.doc(notificationId).get();
  //   final snapshot = await notificationDetail;
  //   ApiNotification? notification;
  //   try{
  //     notification = ApiNotification.fromJson(json: snapshot.data()!);
  //   } catch(e){
  //     debugPrint("Error While Converting data");
  //   }
  //   debugPrint("Current Notification details are ${snapshot.data()}");
  //   return notification;
  // }

  Future<ApiNotification?> getNotificationDetails({required String notificationId}) async {
    debugPrint("Notification details of $notificationId");
    final notificationDetail = storeNotificationRef.doc(notificationId).get();
    final snapshot = await notificationDetail;
    ApiNotification? notification;
    try{
      notification = ApiNotification.fromJson(json: snapshot.data()!);
    } catch(e){
      debugPrint("Error While Converting data");
    }
    debugPrint("Current Notification details are ${snapshot.data()}");
    return notification;
  }
  deleteMyNotification({required String notificationId}) async {
    // await storeUserNotificationRef.doc(notificationId).update({'notificationIds' : FieldValue.arrayRemove([notificationId])}).then((value){
    //   debugPrint("Notification has been deleted");
    // }).onError((error, stackTrace){
    //   debugPrint("Error while deleting notification $error");
    // });
    await storeNotificationRef.doc(notificationId).delete();
  }

  