import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/custom_validation.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:provider/provider.dart';

import '../../../view_model/provider.dart';

class LoginUsingPhone extends StatelessWidget {
  const LoginUsingPhone({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
      width: (w > 960)
          ? 497
          : (w > 450)
              ? 500
              : w * 0.9,
      // width:497,
      decoration: BoxDecoration(
          color: AppColors.logincardColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(25, 55, 102, 0.325),
              offset: Offset(0, 10),
              blurRadius: 40,
              spreadRadius: 2,
            ),
          ]),
      child: Consumer2<Providers, AuthProviders>(
          builder: (context, provider, authProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.login,
              style:  AppStyle.custompoppinTs,
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              AppTexts.loginwithPhMess,
              style:  AppStyle.custompoppinNormalTs,
            ),
            SizedBox(
              height: h * 0.06,
            ),
            CustomTextField(
              onFieldSubmitted: (String? val) {
                Utils.changeFocus(context, authProvider.phoneNumberFocusNode,
                    authProvider.buttonFocusNode);
              },
              focusNode: authProvider.phoneNumberFocusNode,
              customController: authProvider.phoneNumber,
              prefixicon: Icons.phone_outlined,
              hintext: AppTexts.phoneNumber,
            ),
            SizedBox(
              height: h * 0.06,
            ),
            InkWell(
              onTap: () async {
                await authProvider.sendOtp().then((value) {
                  if (value == true) provider.loginWithOTP();
                });
              },
              child: Container(
                height: h * 0.054,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                    child: (authProvider.loading)
                        ? const CircularProgressIndicator(color: AppColors.logincardColor,)
                        : Text(
                  AppTexts.continu,
                  style:  AppStyle.sevenOneSixWhite,
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      height: 1.5,
                      width: w * 0.1,
                      color: const Color.fromARGB(255, 234, 232, 232),
                    ),
                  ),
                  Text(
                    AppTexts.or,
                    style:  AppStyle.sixOneFourBlack,
                  ),
                  Expanded(
                    child: Container(
                      height: 1.5,
                      width: w * 0.13,
                      color: const Color.fromARGB(255, 234, 232, 232),
                    ),
                  ),
                ],
              ),
            ),

            InkWell(
                onTap: () {
                  provider.desktopLogin();
                },
                child: Center(
                    child: Text(
                  AppTexts.loginWithPass,
                  style:  AppStyle.sixOneSixBlueUnderLineTs,
                ))),
            SizedBox(
              height: h * 0.032,
            ),

            Center(
              child: SizedBox(
                width: w * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Image.asset(
                      AppImages.fbimg,
                      height: h * 0.04,
                      width: w * 0.057,
                    )),
                    Expanded(
                        child: InkWell( onTap: () async {
                            await authProvider.googleLogin().then((value) {
                              if (value == true) {
                                provider.basePage();
                              }
                            }).onError((error, stackTrace) {
                              debugPrint("Error while Login");
                            });
                          },
                          child: Image.asset(
                                              AppImages.googly,
                                              height: h * 0.04,
                                              width: w * 0.057,
                                            ),
                        )),
                    Expanded(
                        child: Image.asset(
                      AppImages.linkimg,
                      height: h * 0.04,
                      width: w * 0.057,
                    )),
                    Expanded(
                        child: Image.asset(
                      AppImages.appleimg,
                      height: h * 0.04,
                      width: w * 0.057,
                    ))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            InkWell(
              onTap: () {
                provider.signUpCard();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.dontHaveAccount,
                    style:  AppStyle.fiveOneFourBlack,
                  ),
                  Text(
                    AppTexts.signUp,
                    style:  AppStyle.sixOneTwoBlueUl,
                  )
                ],
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
          ],
        );
      }),
    );
 
  }
}
