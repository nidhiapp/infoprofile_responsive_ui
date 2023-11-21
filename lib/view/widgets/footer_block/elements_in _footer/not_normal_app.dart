import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
class NotNormalApp extends StatelessWidget {
  const NotNormalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: w*0.3,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(AppTexts.notANormal,style: font400_14_white_Ts,),
        Text(AppTexts.servicesAreProvided,style: font400_14_white_Ts,)
      ]),
    );
  }
}