import 'package:flutter/material.dart';


class Providers with ChangeNotifier {
  bool isHovered = false;

  void updateOnHover() {
    isHovered = !isHovered;
    notifyListeners();
  }
  bool isHide = false;

  showHidePassword() {
    isHide = !isHide;
    notifyListeners();
  }
}
