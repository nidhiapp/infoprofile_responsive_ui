import 'package:flutter/material.dart';

class Utils {

  static changeFocus( BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static bool isValidEmail(String? email) {
    if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!)) {
      return true;
    } else {
      return false;
    }
  }

   static String? isValidEmailNull(String? email) {
    if (RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!)) {
      return null;
    } else {
      return "Enter Valid mail!";
    }
  }

  static bool isValidPass(String? value) {
    // RegExp regex =
    //    RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{6,}$');
    if (value!.isEmpty) {
      return false;
    }
    //  else {
    //   if (!regex.hasMatch(value)) {
    //     return 'Enter valid password';
    //   } }
    else {
      return true;
    }
  }


   static String? isValidPassnull(String? value) {
    // RegExp regex =
    //    RegExp(r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{6,}$');
    if (value!.isNotEmpty) {
      return null;
    }
    //  else {
    //   if (!regex.hasMatch(value)) {
    //     return 'Enter valid password';
    //   } }
    else {
      return "enter password";
    }
  }

  static String? isValidph(String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (value.length < 3) {
      return 'Enter a phonenumber';
    }
    return null;
  }

  static hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.focusedChild?.unfocus();
    }
  }


//flushbarmessage

}