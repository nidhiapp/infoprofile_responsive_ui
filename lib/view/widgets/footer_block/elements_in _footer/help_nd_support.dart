// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
class HelpNdSupport extends StatelessWidget {
  const HelpNdSupport({super.key});

  @override
  Widget build(BuildContext context) {
     return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppTexts.termsConditionsFooter,
          style: font600_20_white_Ts
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          AppTexts.gettingStartedFooter,
          style: font400_14_white_Ts
        ),
       
      ],
       );
  }
}