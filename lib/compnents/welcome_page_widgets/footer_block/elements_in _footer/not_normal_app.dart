import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
class NotNormalApp extends StatelessWidget {
  const NotNormalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(AppTexts.notANormal,style: fontFourOneFourTs,),
      Text(AppTexts.servicesAreProvided,style: fontFourOneFourTs,)
    ]);
  }
}