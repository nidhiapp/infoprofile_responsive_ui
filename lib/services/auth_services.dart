import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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
  // // Google SignIn
  // Future<UserCredential> signInWithGoogle() async {
  //   // Sign begins
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Get Authentication details
  //   final GoogleSignInAuthentication gAuth = await googleUser!.authentication;

  //   // Create credentials for the user
  //   final cred = GoogleAuthProvider.credential(
  //       accessToken: gAuth.accessToken, idToken: gAuth.idToken);

  //   // Now let's sign in
  //   return await FirebaseAuth.instance.signInWithCredential(cred);
  // }

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
