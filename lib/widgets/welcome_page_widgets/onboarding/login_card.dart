import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/custom_validation.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:provider/provider.dart';
import '../../../view_model/provider.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return (w > 960)
        ? desktopLoginCard()
        : (w > 450)
            ? tabletLoginCard()
            : mobileLoginCard();
  }

  static Widget desktopLoginCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
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
          builder: (context, provider, authProvider, ch) {
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
              AppTexts.enterUsername,
              style: AppStyle. custompoppinNormalTs,
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
            SizedBox(
              height: h * 0.02,
            ),
            CustomTextField(
              onFieldSubmitted: (String? val) {
                Utils.changeFocus(context, authProvider.passwordFocusNode,
                    authProvider.buttonFocusNode);
              },
              customValidator: Utils.isValidPassnull,
              focusNode: authProvider.passwordFocusNode,
              customController: authProvider.passCont,
              suffixicon: Icons.visibility,
              isPasswordField: true,
              prefixicon: Icons.lock_outlined,
              hintext: AppTexts.password,
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    authProvider.loading;
                    provider.forgetPassword();
                  },
                  child: Text(
                    AppTexts.forgetpass,
                    style: AppStyle. forgetPassTs,
                  ),
                )),
            SizedBox(
              height: h * 0.012,
            ),
            SizedBox(
              height: h * 0.03,
            ),
            InkWell(
              onTap: () async {
                await authProvider.loginUsingEmailAndPassword(context, () {
                 
                }).then((value) {
                  if (value == true) {
                     context.goNamed(MyAppRouteConstants.homePageRoute);
                    // GoRouter.of(context) .pushNamed(MyAppRouteConstants.homePageRoute);
                    //  provider.basePage();
                  }
                }).onError((error, stackTrace) {});
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
                            AppTexts.login,
                            style:  AppStyle.loginButtonTs,
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
                    style:  AppStyle.orTs,
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
                  authProvider.loading;
                  provider.loginUsingPhone();
                  // provider.basePage();
                },
                child: Center(
                    child: Text(
                  AppTexts.loginWith,
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
                        child: InkWell(
                      onTap: () async {
                        await authProvider.googleLogin().then((value) {
                          if (value == true) {
                            GoRouter.of(context)
                                .pushNamed(MyAppRouteConstants.homePageRoute);
                            // provider.basePage();
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
                    style:  AppStyle.forgetPassTs,
                  ),
                  Text(
                    AppTexts.signUp,
                    style:  AppStyle.signupTs,
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

  //for tablet
  static Widget tabletLoginCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
      width: 500,
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
        builder: (context, provider, authProvider, ch) {
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
                AppTexts.enterUsername,
                style:  AppStyle.custompoppinNormalTs,
              ),
              SizedBox(
                height: h * 0.025,
              ),
              CustomTextField(
                onFieldSubmitted: (String? val) {
                  Utils.changeFocus(
                    context,
                    authProvider.emailfocusNode,
                    authProvider.passwordFocusNode,
                  );
                },
                customValidator: Utils.isValidEmailNull,
                focusNode: authProvider.emailfocusNode,
                customController: authProvider.emailCont,
                prefixicon: Icons.email_outlined,
                hintext: AppTexts.usernameEmail,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              CustomTextField(
                onFieldSubmitted: (String? val) {
                  Utils.changeFocus(
                    context,
                    authProvider.passwordFocusNode,
                    authProvider.buttonFocusNode,
                  );
                },
                focusNode: authProvider.passwordFocusNode,
                customValidator: Utils.isValidPassnull,
                customController: authProvider.passCont,
                prefixicon: Icons.lock_outlined,
                suffixicon: Icons.visibility,
                isPasswordField: true,
                hintext: AppTexts.password,
              ),
              SizedBox(
                height: h * 0.012,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    authProvider.loading;
                    provider.forgetPassword();
                  },
                  child: Text(
                    AppTexts.forgetpass,
                    style:  AppStyle.forgetPassTs,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.03,
              ),
              InkWell(
                onTap: () async {
                  await authProvider.loginUsingEmailAndPassword(context, () {
                    provider.basePage();
                  }).then((value) {
                  }).onError((error, stackTrace) {});
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
                            AppTexts.login,
                            style:  AppStyle.loginButtonTs,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.5,
                      width: w * 0.13,
                      color: const Color.fromARGB(255, 234, 232, 232),
                    ),
                    Text(
                      AppTexts.or,
                      style:  AppStyle.orTs,
                    ),
                    Container(
                      height: 1.5,
                      width: w * 0.13,
                      color: const Color.fromARGB(255, 234, 232, 232),
                    ),
                  ],
                ),
              ),
              Center(
                child: InkWell(
                  onTap: () {
                    provider.loginUsingPhone();
                  },
                  child: Text(
                    AppTexts.loginWith,
                    style:  AppStyle.sixOneSixBlueUnderLineTs,
                  ),
                ),
              ),
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
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () async {
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
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          AppImages.linkimg,
                          height: h * 0.04,
                          width: w * 0.057,
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          AppImages.appleimg,
                          height: h * 0.04,
                          width: w * 0.057,
                        ),
                      ),
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
                      style:  AppStyle.forgetPassTs,
                    ),
                    Text(
                      AppTexts.signUp,
                      style: AppStyle.signupTs,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  //for mobile
  static Widget mobileLoginCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
      width: w * 0.9,
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
        ],
      ),
      child: Consumer2<Providers, AuthProvider>(
        builder: (context, provider, authProvider, ch) {
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
                AppTexts.enterUsername,
                style:  AppStyle.custompoppinNormalTs,
              ),
              SizedBox(
                height: h * 0.025,
              ),
              CustomTextField(
                onFieldSubmitted: (String? val) {
                  Utils.changeFocus(
                    context,
                    authProvider.emailfocusNode,
                    authProvider.passwordFocusNode,
                  );
                },
                focusNode: authProvider.emailfocusNode,
                customValidator: Utils.isValidEmailNull,
                customController: authProvider.emailCont,
                prefixicon: Icons.email_outlined,
                hintext: AppTexts.usernameEmail,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              CustomTextField(
                onFieldSubmitted: (String? val) {
                  Utils.changeFocus(
                    context,
                    authProvider.passwordFocusNode,
                    authProvider.buttonFocusNode,
                  );
                },
                focusNode: authProvider.passwordFocusNode,
                customValidator: Utils.isValidPassnull,
                customController: authProvider.passCont,
                suffixicon: Icons.visibility,
                isPasswordField: true,
                prefixicon: Icons.lock_outlined,
                hintext: AppTexts.password,
              ),
              SizedBox(
                height: h * 0.012,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: () {
                    authProvider.loading;
                    provider.forgetPassword();
                  },
                  child: Text(
                    AppTexts.forgetpass,
                    style:  AppStyle.forgetPassTs,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              InkWell(
                onTap: () async {
                  await authProvider
                      .loginUsingEmailAndPassword(context, () {
                        provider.basePage();
                      })
                      .then((value) {
                  }).onError((error, stackTrace) {});
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
                            AppTexts.login,
                            style:  AppStyle.loginButtonTs,
                          ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 1.5,
                      width: w * 0.13,
                      color: const Color.fromARGB(255, 234, 232, 232),
                    ),
                    Text(
                      AppTexts.or,
                      style:  AppStyle.orTs,
                    ),
                    Container(
                      height: 1.5,
                      width: w * 0.13,
                      color: const Color.fromARGB(255, 234, 232, 232),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  provider.loginUsingPhone();
                  //  provider.basePage();
                },
                child: Center(
                  child: Text(
                    AppTexts.loginWith,
                    style:  AppStyle.sixOneSixBlueUnderLineTs,
                  ),
                ),
              ),
              SizedBox(
                height: h * 0.032,
              ),
              Center(
                child: SizedBox(
                  // width: w * 0.2,
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
                          child: InkWell(
                        onTap: () async {
                          await authProvider.googleLogin().then((value) {
                            (value == true)
                                ? provider.basePage()
                                : debugPrint("Failed login");
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
              Center(
                child: Wrap(
                  children: [
                    Text(
                      AppTexts.dontHaveAccount,
                      style:  AppStyle.forgetPassTs,
                    ),
                    InkWell(
                      onTap: () {
                        provider.signUpCard();
                      },
                      child: Text(
                        AppTexts.signUp,
                        style:  AppStyle.signupTs,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: h * 0.02,
              ),
            ],
          );
        },
      ),
    );
  }
}
