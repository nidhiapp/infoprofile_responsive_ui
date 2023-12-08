import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
class Feature_Footer extends StatelessWidget {
  const Feature_Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppTexts.featureHeadingFooter,
          style:  AppStyle.fontSixTwoZeroWhiteTs 
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          AppTexts.viewFeedsFooter,
          style:  AppStyle.fontFourOneFourTs
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
        AppTexts.makeConnectionFooter,
          style: AppStyle. fontFourOneFourTs
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
         AppTexts.createCompanies,
          style: AppStyle.fontFourOneFourTs
        ),
       const SizedBox(
          height: 10,
        ),
        Text(
         AppTexts.mobileApp,
          style:  AppStyle.fontFourOneFourTs
        ),
      ],
    );
  }
  }
