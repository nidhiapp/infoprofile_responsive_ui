import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:provider/provider.dart';

import '../../../view_model/provider.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
         padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 37),
       width:497,
     decoration: BoxDecoration(color: AppColors.logincardColor,
     borderRadius: BorderRadius.circular(12),
     boxShadow:const [BoxShadow(
        color: Color.fromRGBO(25, 55, 102, 0.325),
        offset: Offset(0, 10),
        blurRadius: 40,
        spreadRadius: 2,
      ),]
     ),
        child: Consumer2<Providers, AuthProvider>(
          builder: (context, provider, authProvider, child) {
            return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.forgetpas,
                style: custompoppinTs,
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Text(
                AppTexts.forgetpassMsg,
                style: custompoppinNormalTs,
              ),
              SizedBox(
                height: h * 0.025,
              ),

               CustomTextField(
                customController:authProvider.emailCont,
               // suffixicon: Icons.visibility,
              //  isPasswordField: true,
                prefixicon: Icons.email_outlined,
                hintext: AppTexts.email,
              ),


              SizedBox(
                height: h * 0.04,
              ),

              InkWell(
                onTap: () async {
                  await authProvider.forgetPassword().then((value) {
                    provider.desktopLogin();
                    debugPrint("OTP sent on the mail");
                  }).onError((error, stackTrace){});
                },
                child: Container(
                  height: h * 0.054,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Center(
                      child: Text(
                    AppTexts.continu ,
                    style: loginButtonTs,
                  )),
                ),
              ),


              SizedBox(
                height: h * 0.02,
              ),
            ],
      );
          }
        ),
    );
  }
}

 