import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:provider/provider.dart';
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<AuthProviders, Providers>(
                builder: (context, authProvider, provider, child) {
                  return ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: AppColors.logincardColor,
                              title: const Text(
                                AppTexts.logout,
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                              content: Text(AppTexts.areYouSure,
                                  style: AppStyle.custompoppinNormalTs),
                              actions: [
                                TextButton(
                                  child: const Text("No",
                                      style: TextStyle(color: Colors.black)),
                                  onPressed: () {
                                    Navigator.pop(context); // Close the dialog
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    "Yes",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () async {
                                    await authProvider.logout().then((value) {
                                      context.goNamed(
                                          MyAppRouteConstants.welcomePageRoute);
                                      // if (value == true) {
                                      //   provider.desktopLogin();
                                      // }
                                    });
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(AppTexts.logout));
                },
              );
  }
}