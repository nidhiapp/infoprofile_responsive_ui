import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FirebaseApi {
  FirebaseAuth auth = FirebaseAuth.instance;
  Future<bool?> registerUserWithEmailPassword(
      String email, String password) async {
    bool? res;

    debugPrint("Register Using email --> $email and password --> $password");
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      res = true;
      debugPrint("Success SignUp");
    }).onError((error, stackTrace) {
      debugPrint("Error While SignUp $error");
    });
    return res;
  }

  Future<bool?> isLogin() async {
    bool? res;
    res = auth.currentUser != null;
    return res;
  }

  Future getEmail() async {
    return auth.currentUser!.email ?? "";
  }

  Future<bool?> logOut() async {
    bool? res;
    await auth.signOut().then((value) {
      debugPrint("Logout Success");
      res = true;
    }).onError((error, stackTrace) {
      res = false;
    });
    return res;
  }

  Future<String?> sendOtp(String phoneNumber) async {
    String? res;
    debugPrint("Going to send otp on $phoneNumber");
    await auth.verifyPhoneNumber(
        phoneNumber: "+91$phoneNumber",
        verificationCompleted: (_) {
          debugPrint("Verification is completed");
        },
        verificationFailed: (e) {
          debugPrint("Error while sending otp $e");
        },
        codeSent: (String verificationId, int? token) {
          debugPrint("Verification code is $verificationId");
          res = verificationId;
        },
        codeAutoRetrievalTimeout: (e) {
          debugPrint("Error is $e");
        });
    debugPrint("OTP sent Success $res");
    return res;
  }

  Future<bool?> matchOtp(String verification, String otp) async {
    bool? res;
    final credential = PhoneAuthProvider.credential(
        verificationId: verification, smsCode: otp);
    await auth.signInWithCredential(credential).then((value) {
      debugPrint("OTP Matched response is $value");
      res = true;
    }).onError((error, stackTrace) {
      debugPrint("Failed Matching OTP $error");
      res = false;  
    });
    return res;
  }

  Future<bool?> forgetPassword(String email) async {
    bool? res;
    await auth.sendPasswordResetEmail(email: email).then((value) {
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

  Future<bool?> loginUsingEmailAndPassword(
      String email, String password) async {
    bool? res;
    debugPrint("Email :$email \n Password: $password");
    await auth
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      debugPrint("Response is $value");
      res = true;
    }).onError((error, stackTrace) {
      res = false;
      debugPrint("Error is $error");
    });
    return res;
  }
}
