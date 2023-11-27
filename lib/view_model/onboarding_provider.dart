import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  int _authStateIndex = 0;
  static TextEditingController emailCont = TextEditingController();
 static  TextEditingController passCont = TextEditingController();
  static TextEditingController phoneNumber = TextEditingController();

  int get authStateIndex => _authStateIndex;

  void switchState() {
    _authStateIndex = (_authStateIndex + 1) % 4;
    notifyListeners();
  }
//  void switchToOtp() {
//     _authStateIndex = 1; // Assuming OTP is at index 1, adjust as needed
//     notifyListeners();
//   }
 
}
