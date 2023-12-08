import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

late double h;
late double w;

class AppGlobal {
  static int index = 0;
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> navigatorScaffoldKey =
    GlobalKey<ScaffoldMessengerState>();
const Duration apiTimeOut = Duration(minutes: 2);
