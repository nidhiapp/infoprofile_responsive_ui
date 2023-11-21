import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
class CompanyFooter extends StatelessWidget {
  const CompanyFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppTexts.companyBlock,
          style: font600_20_white_Ts
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppTexts.aboutFooter,
          style: font400_14_white_Ts
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
        AppTexts.contactFooter,
          style: font400_14_white_Ts
        ),
       
      ],
    );
  }
}