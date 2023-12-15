import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
class InfoProfileIsDesigned extends StatelessWidget {
  const InfoProfileIsDesigned({super.key});

  @override
  Widget build(BuildContext context) {
    return (w > 960)
        ? desktopInfoProfileIsDesigned()
        : (w > 450)
            ? tabletInfoProfileIsDesigned()
            : mobileInfoProfileIsDesigned();
     
  }
  static Widget desktopInfoProfileIsDesigned(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppTexts.infoprofile,style: AppStyle.fiveTwoFiveBlack,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: AppStyle.fiveTwoFiveBlack,),
            Text(AppTexts.provide,style: AppStyle.providesTs,),
            Text(AppTexts.you,style: AppStyle.fiveTwoFiveBlack,)
          ],
        )
      ],
    );
  }

  //FOR TABLET
   static Widget tabletInfoProfileIsDesigned(){
    return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppTexts.infoprofile,style: AppStyle. fiveTwoZeroBlack,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: AppStyle. fiveTwoZeroBlack,),
            Text(AppTexts.provide,style: AppStyle.fiveTwoZeroBlue ,),
            Text(AppTexts.you,style: AppStyle. fiveTwoZeroBlack,)
          ],
        )
      ],
    );
  }

  //for mobile

   static Widget mobileInfoProfileIsDesigned(){
   return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppTexts.infoprofile,style: AppStyle.fiveOneFiveBlack,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: AppStyle.fiveOneFiveBlack,),
            Text(AppTexts.provide,style: AppStyle.fiveOneFiveBlue ,),
            Text(AppTexts.you,style: AppStyle.fiveOneFiveBlack,)
          ],
        )
      ],
    );
  }
}