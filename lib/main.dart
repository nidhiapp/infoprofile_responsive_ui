import 'package:flutter/material.dart';
import 'package:info_profile_ui/home_page.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context)=>Providers(),
    child:MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Infoprofile',
        home: Scaffold(
          body: CompleteSetUps())));
  }
}
