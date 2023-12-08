import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/credentials.dart';
import 'package:info_profile_ui/screens/home_page.dart';
import 'package:info_profile_ui/utils/routes/app_routes_configue.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
    apiKey: Cred.apiKey,
    authDomain: Cred.authDomain,
    projectId: Cred.projectId,
    messagingSenderId: Cred.messagingSenderId,
    appId: Cred.appId,
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
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      // child: MaterialApp(
      //   home: HomePage(),
      // ),
      child:MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Infoprofile',
     // home: WelcomePage(),
        routeInformationParser: MyAppRouter.router.routeInformationParser,
        routerDelegate: MyAppRouter.router.routerDelegate ,
        routeInformationProvider: MyAppRouter.router.routeInformationProvider,
      
    ),
    );
  }
}
