import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
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
        Text(AppTexts.infoprofile,style: AppStyle.infoprofileTs,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: AppStyle.infoprofileTs,),
            Text(AppTexts.provide,style: AppStyle.providesTs,),
            Text(AppTexts.you,style: AppStyle.infoprofileTs,)
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
        Text(AppTexts.infoprofile,style: AppStyle.tabinfoprofileTs,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: AppStyle.tabinfoprofileTs,),
            Text(AppTexts.provide,style: AppStyle.tabinfoprofileblueTs ,),
            Text(AppTexts.you,style: AppStyle.tabinfoprofileTs,)
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
        Text(AppTexts.infoprofile,style: AppStyle.mobinfoprofileTs,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: AppStyle.mobinfoprofileTs,),
            Text(AppTexts.provide,style: AppStyle.mobinfoprofileblueTs ,),
            Text(AppTexts.you,style: AppStyle.mobinfoprofileTs,)
          ],
        )
      ],
    );
  }
}