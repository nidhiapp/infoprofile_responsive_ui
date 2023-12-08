import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  // basepage = 6

  int index = AppGlobal.index;

  signUpCard() {
    index = 1;
    notifyListeners();
  }

  desktopLogin() {
    index = 0;
    notifyListeners();
  }

  otpPage() {
    index = 2;
    notifyListeners();
  }

  loginUsingPhone() {
    index = 3;
    notifyListeners();
  }

  resetPassword() {
    index = 5;
    notifyListeners();
  }

  forgetPassword() {
    index = 4;
    notifyListeners();
  }

  loginWithOTP() {
    index = 2;
    notifyListeners();
  }

  basePage() {
    index = 6;
    notifyListeners();
  }

  showHidePassword() {
    isHide = !isHide;
    notifyListeners();
  }

  int tabIndex = 0;

  void updateTabIndex(int newIndex) {
    tabIndex = newIndex;
    notifyListeners();
  }

  bool isPicked = false;
  File? _pickedImage;
  get pickedImage => _pickedImage;
  Uint8List? webImage = Uint8List(8);
  Future<void> pickImage() async {
    if (!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        _pickedImage = selected;
        // debugPrint("Image Picked path is ${image.path}");
        isPicked = true;
        notifyListeners();
      } else {
        debugPrint("No image selected");
        isPicked = false;
      }
    } else if (kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var webSelectedImageBytes = await image.readAsBytes();
        webImage = webSelectedImageBytes;
        _pickedImage = File('a');
        // debugPrint("Image Picked path is ----> ${webImage}");
        isPicked = true;
        notifyListeners();
      } else {
        isPicked = false;
      }
    }
  }

  resetImage() {
    isPicked = false;
    webImage = null;
    notifyListeners();
  }
}
