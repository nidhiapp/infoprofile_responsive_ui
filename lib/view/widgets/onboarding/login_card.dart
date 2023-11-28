import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textfield.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:provider/provider.dart';

import '../../../view_model/provider.dart';

class LoginCard extends StatelessWidget {
  const LoginCard({super.key, });

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
     padding: const EdgeInsets.symmetric(horizontal:17,vertical: 17),
     width:497,
     decoration: BoxDecoration(
       color: AppColors.logincardColor,
     borderRadius: BorderRadius.circular(12),
     boxShadow:const [BoxShadow(
        color: Color.fromRGBO(25, 55, 102, 0.325),
        offset: Offset(0, 10),
        blurRadius: 40,
        spreadRadius: 2,
      ),]
     ),
      child: Consumer2<Providers, AuthProvider>(
        builder: (context, provider, authProvider, ch) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTexts.login,style:custompoppinTs,),
              SizedBox(height: h*0.02,),
              Text(AppTexts.enterUsername,style:custompoppinNormalTs ,),
              SizedBox(height: h*0.025,),
              CustomTextField(
                customController:authProvider.emailCont,
                prefixicon: Icons.email_outlined,
                hintext: AppTexts.usernameEmail,
               ),
              SizedBox(height: h*0.02,),
              CustomTextField(
                customController:authProvider.passCont,
               suffixicon: Icons.visibility,
                 isPasswordField: true,
              prefixicon: Icons.lock_outlined,
              hintext: AppTexts.password,

               ),
              SizedBox(height: h*0.012,),
              InkWell(
                onTap: (){
                  provider.forgetPassword();
                },
                child: Align(alignment: Alignment.bottomRight,
                  child: Text(AppTexts.forgetpass,style: forgetPassTs,)),
              ),
              SizedBox(height: h*0.03,),
              InkWell(
                onTap: (){
                  authProvider.loginUsingEmailAndPassword(context);
                },
                child: Container(
                  height: h*0.054,
                  decoration: BoxDecoration(color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: Text(AppTexts.login,style: loginButtonTs,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Expanded(
                    child: Container(height: 1.5,width: w*0.1,
                    color: const Color.fromARGB(255, 234, 232, 232),
                    ),
                  ),
                  Text(AppTexts.or,style: orTs,),
                   Expanded(
                     child: Container(height: 1.5,width: w*0.13,
                                 color: const Color.fromARGB(255, 234, 232, 232),
                                 ),
                   ),
                ],),
              ),
              InkWell(
                onTap: (){
                  provider.loginUsingPhone();
                },
                child: Center(child: Text(AppTexts.loginWith,style: loginwithOTPTs,))),
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
              SizedBox(height: h*0.02,),
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

  //for tablet
  static Widget  tabletLoginCard(){
     return Container(
     padding: const EdgeInsets.symmetric(horizontal:17,vertical: 17),
    width:  500,
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
          builder: (context, provider, authProvider, ch) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTexts.login,style:custompoppinTs,),
              SizedBox(height: h*0.02,),
              Text(AppTexts.enterUsername,style:custompoppinNormalTs ,),
              SizedBox(height: h*0.025,),
              CustomTextField(
                customController: authProvider.emailCont,
                prefixicon: Icons.email_outlined,
                hintext: AppTexts.usernameEmail,
              ),
              SizedBox(height: h*0.02,),
              CustomTextField(
                customController: authProvider.passCont,
                prefixicon: Icons.lock_outlined,
                suffixicon: Icons.visibility,
                isPasswordField: true,
                hintext: AppTexts.password,
              ),
              SizedBox(height: h*0.012,),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(AppTexts.forgetpass,style: forgetPassTs,)),
                SizedBox(height: h*0.03,),
              InkWell(
                onTap: (){
                  authProvider.loginUsingEmailAndPassword(context);
                },
                child: Container(
                  //width: w*462/1440,
                  height: h*0.054,
                  decoration: BoxDecoration(color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: InkWell(onTap: () async {
                  await authProvider.googleLogin();
                }, child: Text(AppTexts.login,style: loginButtonTs,))),
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(height: 1.5,width: w*0.13,
                  color: const Color.fromARGB(255, 234, 232, 232),
                  ),
                  Text(AppTexts.or,style: orTs,),
                   Container(height: 1.5,width: w*0.13,
                  color: const Color.fromARGB(255, 234, 232, 232),
                  ),
                ],),
              ),

              Center(child: InkWell(onTap: () {
                provider.loginUsingPhone();

              }, child: Text(AppTexts.loginWith,style: loginwithOTPTs,))),
              SizedBox(height: h*0.032,),

              Center(
                child: SizedBox(width: w*0.2,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Expanded(child: Image.asset(AppImages.fbimg,height: h*0.04, width: w*0.057,)),
                     Expanded(child: InkWell(onTap: () async {
                       await authProvider.googleLogin();
                     }, child: Image.asset(AppImages.googly, height: h*0.04, width: w*0.057,))),
                     Expanded(child: Image.asset(AppImages.linkimg,height: h*0.04, width: w*0.057,)),
                    Expanded(child: Image.asset(AppImages.appleimg,height: h*0.04, width: w*0.057,))


                  ],),
                ),
              ),
               SizedBox(height: h*0.02,),
               InkWell(
                 onTap: (){
                   provider.signUpCard();
                 },
                 child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppTexts.dontHaveAccount,style: forgetPassTs,),
                  Text(AppTexts.signUp,style: signupTs,)],),
               ),
                SizedBox(height: h*0.02,),


            ],
          );
        }
      ),
    );
  }

  //for mobile
   static Widget  mobileLoginCard(){
 return Container(
     padding: const EdgeInsets.symmetric(horizontal:17,vertical: 17),
    width: w*0.9,
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
          builder: (context, provider, authProvider, ch) {
          return Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppTexts.login,style:custompoppinTs,),
              SizedBox(height: h*0.02,),
              Text(AppTexts.enterUsername,style:custompoppinNormalTs ,),
              SizedBox(height: h*0.025,),
              CustomTextField(
                customController:authProvider.emailCont,
                prefixicon: Icons.email_outlined,
                hintext: AppTexts.usernameEmail,
              ),
              SizedBox(height: h*0.02,),
              CustomTextField(
                customController:authProvider.passCont,
                suffixicon: Icons.visibility,
                isPasswordField: true,
                prefixicon: Icons.lock_outlined,
                hintext: AppTexts.password,
              ),
              SizedBox(height: h*0.012,),

              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(onTap: () async {
                  await authProvider.forgetPassword();
                }, child: Text(AppTexts.forgetpass, style: forgetPassTs,)),
              ),
              SizedBox(height: h*0.03,),
              InkWell(
                onTap: (){
                  authProvider.loginUsingEmailAndPassword(context);
                },
                child: Container(
                  height: h*0.054,
                  decoration: BoxDecoration(color: AppColors.primaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
                  child: Center(
                    child: Text(AppTexts.login,style: loginButtonTs,)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Container(height: 1.5,width: w*0.13,
                    color: const Color.fromARGB(255, 234, 232, 232),
                   ),
                   Text(AppTexts.or,style: orTs,),
                   Container(height: 1.5,width: w*0.13,
                    color: const Color.fromARGB(255, 234, 232, 232),
                  ),
                ],
                ),
              ),

              InkWell(
                onTap: (){
                  provider.loginUsingPhone();
                },
                child: Center(child: Text(AppTexts.loginWith,style: loginwithOTPTs,))),
              SizedBox(height: h*0.032,),

              Center(
                child: SizedBox(width: w*0.2,
                  child: Row(mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    Expanded(child: Image.asset(AppImages.fbimg,height: h*0.04, width: w*0.057,)),
                     Expanded(child: InkWell(
                        onTap: () async {
                          await authProvider.googleLogin();
                        },
                         child: Image.asset(AppImages.googly,height: h*0.04, width: w*0.057,))),
                     Expanded(child: Image.asset(AppImages.linkimg,height: h*0.04, width: w*0.057,)),
                    Expanded(child: Image.asset(AppImages.appleimg,height: h*0.04, width: w*0.057,))
                  ],),
                ),
              ),
              SizedBox(height: h*0.02,),
              InkWell(
                onTap: (){
                  provider.signUpCard();
                },
                child: Center(
                  child: Wrap(
                    children: [
                    Text(AppTexts.dontHaveAccount,style: forgetPassTs,),
                    Text(AppTexts.signUp,style: signupTs,)],),
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
