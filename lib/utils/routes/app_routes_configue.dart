import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_profile_ui/screens/edit_profile_page.dart';
import 'package:info_profile_ui/screens/error_page.dart';
import 'package:info_profile_ui/screens/home_page.dart';
import 'package:info_profile_ui/screens/profile_page.dart';
import 'package:info_profile_ui/screens/welcome_page.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';

class MyAppRouter {
  static GoRouter router = GoRouter(
      navigatorKey: navigatorKey,
      routes: [
        GoRoute(
          name: MyAppRouteConstants.welcomePageRoute,
          path: '/',
          builder: (context, state) {
            return const WelcomePage();
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.homePageRoute,
          path: MyAppRouteConstants.homePageRoute,
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.profilePageRoute,
          path: '${MyAppRouteConstants.profilePageRoute + '/:uid'}',
          builder: (context, state) {
            return ProfilePage(
              uid: state.pathParameters['uid']!,
            );
          },
        ),
        GoRoute(
          name: MyAppRouteConstants.editProfilePageRoute,
          path: '${MyAppRouteConstants.editProfilePageRoute+ '/:uid'}',
          builder: (context, state) {
            return  EditProfilePage(uid: state.pathParameters['uid']!);
          },
        )
      ],
      errorPageBuilder: (context, state) {
        return const MaterialPage(child: ErrorPage());
      });
}
