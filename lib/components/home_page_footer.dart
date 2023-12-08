import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
class HomePageFooter extends StatelessWidget {
  const HomePageFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22, vertical: 28),
       
        decoration:BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.primaryColor
        ) ,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         Wrap(spacing: 50,runSpacing: 5,
           children: [
            Text("Privacy Policy",style:AppStyle.fourOneFourUnderLineTs,),
            Text("About Us",style:AppStyle.fourOneFourUnderLineTs,),
            Text("Contact Us",style:AppStyle.fourOneFourUnderLineTs,),
            Text("Terms & Conditions",style:AppStyle.fourOneFourUnderLineTs,),
            Text("FAQs",style:AppStyle.fourOneFourUnderLineTs,)
           ],
         ),
         SizedBox(height: 10,),
        Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppTexts.featureHeadingFooter,
            style:  AppStyle.fontSixTwoZeroWhiteTs 
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            AppTexts.viewFeedsFooter,
            style:  AppStyle.fourOneFouroffWhiteColTs
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
          AppTexts.makeConnectionFooter,
            style: AppStyle.fourOneFouroffWhiteColTs
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
           AppTexts.createCompanies,
            style: AppStyle.fourOneFouroffWhiteColTs
          ),
         const SizedBox(
            height:5,
          ),
          Text(
           AppTexts.mobileApp,
            style:  AppStyle.fourOneFouroffWhiteColTs
          ),
        ],
      ),
    
         SizedBox(height: 8,),
        Container(
          constraints: BoxConstraints(
            maxWidth: 154
          ),
          child: Image.asset(AppImages.infoProfFooterLogo,)),
        SizedBox(height: 8,),
        Text("Not a  normal app, its unique!",
        style: GoogleFonts.poppins(
        textStyle:TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1) ,
          fontSize: 10,
          fontWeight: FontWeight.w400,
    
          ), 
          ),),
        Text("Services are provided everywhere.",
        style: GoogleFonts.poppins(
        textStyle:TextStyle(
        color: Color.fromRGBO(255, 255, 255, 1) ,
          fontSize: 10,
          fontWeight: FontWeight.w400,
    
          ), ),),
          SizedBox(height: 20,),
          Container(
            constraints: BoxConstraints(
            maxWidth: 154
          ),
            child: Image.asset(AppImages.socilaMedia,))
        ],),
      ),
    );
  }
}