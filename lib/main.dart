import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/services/auth_services.dart';
import 'package:info_profile_ui/ui/home_page.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp(options:
  const FirebaseOptions(
      apiKey: "AIzaSyA5a8rxTDtxPWUGen6TyN1he6vpLb8lEaU",
      authDomain: "infoprofile-6b660.firebaseapp.com",
      projectId: "infoprofile-6b660",
      messagingSenderId: "19539703423",
      appId: "1:19539703423:web:74622f4dae41ccf911f14a",
    ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Providers()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),],
         child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Infoprofile',
            home: Scaffold(
              body:CompleteSetUps(),
            ),
       ),
    );
  }
}
