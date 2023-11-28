import 'package:flutter/material.dart';
import '../utils/global.dart';


class Providers with ChangeNotifier {
  bool isHovered = false;

  void updateOnHover() {
    isHovered = !isHovered;
    notifyListeners();
  }
  bool isHide = false;


  // desktop login card = 0
  // SignUp Card = 1
  // OTP Page = 2
  // Login Using Phone = 3
  // Forget Password = 4
  // Reset Password = 5
  //basepage=6

  int index = AppGlobal.index;

  signUpCard(){
    index = 1;
    notifyListeners();
  }
  desktopLogin(){
    index = 0;
    notifyListeners();
  }

  otpPage(){
    index = 2;
    notifyListeners();
  }

  loginUsingPhone(){
    index = 3;
    notifyListeners();
  }

  resetPassword(){
    index = 5;
    notifyListeners();
  }

  forgetPassword(){
    index = 4;
    notifyListeners();
  }

  loginWithOTP(){
    index = 2;
    notifyListeners();
  }
 basePage(){
    index = 6;
    notifyListeners();
  }

  

  showHidePassword() {
    isHide = !isHide;
    notifyListeners();
  }
}
