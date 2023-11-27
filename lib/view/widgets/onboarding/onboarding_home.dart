import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:provider/provider.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   // var authProvider = Provider.of<AuthProvider>(context);
    // List<Widget> authContainers = [
    //   LoginContainer(onPressed: authProvider.switchState),
    //   OTPContainer(onPressed: authProvider.switchState),
    //   // ForgetPasswordContainer(onPressed: authProvider.switchState),
    //   // ResetPasswordContainer(onPressed: authProvider.switchState),
    // ];

    return Center(
     // child: authContainers[authProvider.authStateIndex],
    );
  }
}

class LoginContainer extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginContainer({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
      width: 497,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.login,
            style: custompoppinTs,
          ),
          SizedBox(
            height: h * 0.02,
          ),
          Text(
            AppTexts.enterUsername,
            style: custompoppinNormalTs,
          ),
          SizedBox(
            height: h * 0.025,
          ),
          CustomTextField(
            customController:AuthProvider.emailCont,
            prefixicon: Icons.email_outlined,
            hintext: AppTexts.usernameEmail,
          ),
          SizedBox(
            height: h * 0.02,
          ),
          CustomTextField(
            customController: AuthProvider.passCont,
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
              child: Text(
                AppTexts.forgetpass,
                style: forgetPassTs,
              )),
          SizedBox(
            height: h * 0.03,
          ),
          Container(
            height: h * 0.054,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
                child: Text(
              AppTexts.login,
              style: loginButtonTs,
            )),
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
                  style: orTs,
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
          Center(
              child: Text(
            AppTexts.loginWith,
            style: loginwithOTPTs,
          )),
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
                      child: Image.asset(
                    AppImages.googly,
                    height: h * 0.04,
                    width: w * 0.057,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppTexts.dontHaveAccount,
                style: forgetPassTs,
              ),
              InkWell(onTap: onPressed,
                child: Text(
                  AppTexts.signUp,
                  style: signupTs,
                ),
              )
            ],
          ),
          SizedBox(
            height: h * 0.02,
          ),
        ],
      ),
    );
  }
}

class OTPContainer extends StatelessWidget {
  final VoidCallback onPressed;

  const OTPContainer({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 200,
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('OTP Container'),
          // Add your OTP form fields here
          ElevatedButton(
            onPressed: onPressed,
            child: Text('Next'),
          ),
        ],
      ),
    );
  }
}

// class ForgetPasswordContainer extends StatelessWidget {
//   final VoidCallback onPressed;

//   const ForgetPasswordContainer({Key? key, required this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 200,
//       color: Colors.green,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Forget Password Container'),
//           // Add your forget password form fields here
//           ElevatedButton(
//             onPressed: onPressed,
//             child: Text('Next'),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ResetPasswordContainer extends StatelessWidget {
//   final VoidCallback onPressed;

//   const ResetPasswordContainer({Key? key, required this.onPressed})
//       : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 300,
//       height: 200,
//       color: Colors.red,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text('Reset Password Container'),
//           // Add your reset password form fields here
//           ElevatedButton(
//             onPressed: onPressed,
//             child: Text('Next'),
//           ),
//         ],
//       ),
//     );
//  }
//}
