import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
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
        Text(AppTexts.infoprofile,style: infoprofileTs,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: infoprofileTs,),
            Text(AppTexts.provide,style: providesTs,),
            Text(AppTexts.you,style: infoprofileTs,)
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
        Text(AppTexts.infoprofile,style: tabinfoprofileTs,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: tabinfoprofileTs,),
            Text(AppTexts.provide,style: tabinfoprofileblueTs ,),
            Text(AppTexts.you,style: tabinfoprofileTs,)
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
        Text(AppTexts.infoprofile,style: mobinfoprofileTs,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppTexts.what,style: mobinfoprofileTs,),
            Text(AppTexts.provide,style: mobinfoprofileblueTs ,),
            Text(AppTexts.you,style: mobinfoprofileTs,)
          ],
        )
      ],
    );
  }
}