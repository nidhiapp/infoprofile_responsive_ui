import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/models/user_profile.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/keys.dart';


class FirebaseProfileRepository{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final storeRef = FirebaseFirestore.instance.collection(FirebaseKey.userKey);

  Future<bool?> registerUser(UserProfileModel user) async {
    bool? res;
    await storeRef.doc(user.uid).set(user.toMap()).then((value) {
      res = true;
    }).onError((error, stackTrace) {
      debugPrint("Error occurred while Registration \nError: $error");
      res = false;
    });
    return res;
  }

  Stream<UserProfileModel?> getCurrentUserProfile(String? currentUserUID) {
    UserProfileModel? res;
    final fireStoreStream = storeRef.doc(currentUserUID ?? "").snapshots();
    return fireStoreStream.map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
      if (snapshot.exists)
      {
        final Map<String, dynamic> data = snapshot.data()!;
        res = UserProfileModel.fromJson(data);
      }
      return res;
    });
  }

  Future updateProfile() async {

  }

  Future removeFollower({required String uid}) async {
    String id = _auth.currentUser!.uid;
    try{
      await storeRef.doc(uid).update({'followingList':FieldValue.arrayRemove([id])});
      await storeRef.doc(id).update({'followerList':FieldValue.arrayRemove([uid])});
    } catch(e){
      debugPrint("Error while removeFollower $e");
    }
  }

  Future removeFollowing({required String uid}) async {
    String id = _auth.currentUser!.uid;
    try{
      await storeRef.doc(uid).update({'followerList':FieldValue.arrayRemove([id])});
      await storeRef.doc(id).update({'followingList':FieldValue.arrayRemove([uid])});
    } catch(e){
      debugPrint("Error while removeFollowing $e");
    }
  }

}