import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/repository/firebase_api.dart';

class AuthServices {
  Future isUserAlreadyLogin() async {
    bool? res;
    res = await FirebaseApi().isLogin();
    return res;
  }
}

class GoogleAuthService {

  Future<User?> signInWithGoogle() async {
    User? user;
    FirebaseAuth auth = FirebaseAuth.instance;
    GoogleAuthProvider authProvider = GoogleAuthProvider();
    try {
      final UserCredential userCredential =
          await auth.signInWithPopup(authProvider);
      user = userCredential.user;
    } catch (e) {
      debugPrint("Error While Google Login $e");
      throw Error();
    }
    return user;
  }
}
