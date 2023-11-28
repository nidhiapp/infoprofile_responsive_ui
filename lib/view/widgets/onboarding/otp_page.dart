import 'package:flutter/material.dart';
import 'package:info_profile_ui/ui/base_page.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 37),
         width: (w > 960)
        ? 497
        : (w > 450)
            ? 500
            :  w*0.9,
      //  width:497,
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
         return Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTexts.otpAuth,style:custompoppinTs,),
              SizedBox(height: h*0.02,),
              Text(AppTexts.enter4dig,style:custompoppinNormalTs ,),
              SizedBox(height: h*0.06,),
              Center(
                  child: SizedBox(width: w*0.25,
                    child: Pinput(
                      controller: authProvider.otpController,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      length: 6,
                      defaultPinTheme: PinTheme(
                        textStyle: const TextStyle(fontSize: 20),
                        height: h * 0.08,
                        width: w * 0.045,
                        decoration: BoxDecoration(
                            // color: Colors.black,
                            border: Border.all(color: AppColors.muteCol),
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
            ),
              SizedBox(height: h*0.06,),
              Container(height: h*0.054,
                decoration: BoxDecoration(color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(
                  child: InkWell(onTap: () async {
                    await authProvider.verifyOtp().then((value){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BasePage()));
                    });
                  }, child: Text(AppTexts.login,style: loginButtonTs,))),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(height: 1.5,width: w*0.1,
                      color: const Color.fromARGB(255, 234, 232, 232),
                      ),
                    ),
                    Text(AppTexts.or,style: orTs,),
                    Expanded(
                     child: Container(
                       height: 1.5,width: w*0.13,
                       color: const Color.fromARGB(255, 234, 232, 232),
                     ),
                   ),
                ],),
              ),
              Center(
                child: InkWell(
                  onTap: (){
                  provider.desktopLogin();
              }, child: Text(AppTexts.loginWithPass,style: loginwithOTPTs,))),
              SizedBox(height: h*0.032,),

              Center(
                child: SizedBox(width: w*0.2,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Expanded(child: Image.asset(AppImages.fbimg,height: h*0.04, width: w*0.057,)),
                     Expanded(child: Image.asset(AppImages.googly,height: h*0.04, width: w*0.057,)),
                     Expanded(child: Image.asset(AppImages.linkimg,height: h*0.04, width: w*0.057,)),
                    Expanded(child: Image.asset(AppImages.appleimg,height: h*0.04, width: w*0.057,))


                  ],),
                ),
              ),
              SizedBox(height: h*0.03,),
              InkWell(
                onTap: (){
                  provider.signUpCard();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppTexts.dontHaveAccount,style: forgetPassTs,),
                    Text(AppTexts.signUp,style: signupTs,)
                  ],
                ),
              ),
              SizedBox(height: h*0.02,),

            ],
          );
       }
     ),
    );
  }
}