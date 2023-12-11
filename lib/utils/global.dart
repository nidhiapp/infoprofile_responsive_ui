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


String formatMillisecondsSinceEpoch(int millisecondsSinceEpoch) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  DateTime now = DateTime.now();

  Duration difference = now.difference(dateTime);

  if (difference.inSeconds <= const Duration(hours: 2).inSeconds) {
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minute${difference.inMinutes != 1 ? 's' : ''} ago';
    } else {
      return '${difference.inHours} hour${difference.inHours != 1 ? 's' : ''} ago';
    }
  } else if (difference.inDays >= 1 && difference.inDays < 7) {
    return '${difference.inDays} day${difference.inDays != 1 ? 's' : ''} ago';
  } else {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }
}