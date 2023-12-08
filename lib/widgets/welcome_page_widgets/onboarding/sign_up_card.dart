import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/custom_validation.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:provider/provider.dart';
import '../../../view_model/provider.dart';

class SignUpCard extends StatefulWidget {
  const SignUpCard({super.key});

  @override
  State<SignUpCard> createState() => _SignUpCardState();
}

class _SignUpCardState extends State<SignUpCard> {
  bool _acceptPrivacyPolicy = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 37),
      width: (w > 960)
          ? 497
          : (w > 450)
              ? 500
              : w * 0.9,
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
      child: Consumer2<Providers, AuthProvider>(
          builder: (context, provider, authProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppTexts.signUp,
              style:  AppStyle.custompoppinTs,
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Text(
              AppTexts.signupMessage,
              style:  AppStyle.custompoppinNormalTs,
            ),
            SizedBox(
              height: h * 0.025,
            ),
            CustomTextField(
              onFieldSubmitted: (String? val) {
                Utils.changeFocus(context, authProvider.emailfocusNode,
                    authProvider.passwordFocusNode);
              },
              customValidator: Utils.isValidEmailNull,
              focusNode: authProvider.emailfocusNode,
              customController: authProvider.emailCont,
              prefixicon: Icons.email_outlined,
              hintext: AppTexts.usernameEmail,
            ),
            //   SizedBox(
            //     height: h * 0.02,
            //   ),
            //   CustomTextField(
            //     onFieldSubmitted: (String? val) {
            //   Utils.changeFocus(context, authProvider.phoneNumberFocusNode,
            //         authProvider.passwordFocusNode);
            // },
            // customValidator: Utils.isValidph,
            // focusNode: authProvider.phoneNumberFocusNode,
            //     customController: authProvider.phoneNumber,
            //    // suffixicon: Icons.visibility,
            //   //  isPasswordField: true,
            //     prefixicon: Icons.phone_outlined,
            //     hintext: AppTexts.phoneNumber,
            //   ),
            SizedBox(
              height: h * 0.02,
            ),
            CustomTextField(
              onFieldSubmitted: (String? val) {
                Utils.changeFocus(context, authProvider.passwordFocusNode,
                    authProvider.buttonFocusNode);
              },
              focusNode: authProvider.passwordFocusNode,
              customValidator: Utils.isValidph,
              customController: authProvider.passCont,
              suffixicon: Icons.visibility,
              isPasswordField: true,
              prefixicon: Icons.lock_outlined,
              hintext: AppTexts.password,
            ),
            SizedBox(
              height: h * 0.04,
            ),
            InkWell(
              onTap: () async {
                if (_acceptPrivacyPolicy) {
                  await authProvider.createAccount(context).then((value) {
                    if (value == true) {
                      provider.desktopLogin();
                    } else {
                      
                    }
                  });
                }
              },
              child: Container(
                height: h * 0.054,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                    child: (authProvider.loading)
                        ? const CircularProgressIndicator(
                            color: AppColors.logincardColor,
                          )
                        : Text(
                            AppTexts.signUp,
                            style:  AppStyle.loginButtonTs,
                          )),
              ),
            ),
            SizedBox(
              height: h * 0.03,
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  value: _acceptPrivacyPolicy,
                  onChanged: (value) {
                    setState(() {
                      _acceptPrivacyPolicy = value!;
                      debugPrint("Value changed i.e. $_acceptPrivacyPolicy");
                    });
                  },
                  shape: const CircleBorder(),
                ),
                Expanded(
                    child: Wrap(
                  children: [
                    Text(
                      AppTexts.termcon,
                      style:  AppStyle.fontFiveOneTwoTs,
                    ),
                    Text(
                      AppTexts.privacy,
                      style:  AppStyle.termConTs,
                    ),
                    Text(
                      AppTexts.and,
                      style:  AppStyle.fontFiveOneTwoTs,
                    ),
                    Text(
                      AppTexts.termsOfUses,
                      style:  AppStyle.termConTs,
                    ),
                  ],
                )),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),
            InkWell(
              onTap: () {
                provider.desktopLogin();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppTexts.alreadyHvan,
                    style:  AppStyle.forgetPassTs,
                  ),
                  InkWell(
                      onTap: () {
                        provider.desktopLogin();
                      },
                      child: Text(
                        AppTexts.login,
                        style:  AppStyle.signupTs,
                      ))
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
