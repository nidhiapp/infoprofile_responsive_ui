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
          style: fontSixTwoZeroWhiteTs 
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          AppTexts.aboutFooter,
          style: fontFourOneFourTs
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
        AppTexts.contactFooter,
          style: fontFourOneFourTs
        ),
       
      ],
    );
  }
}