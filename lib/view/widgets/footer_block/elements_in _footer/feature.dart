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
          style: font600_20_white_Ts
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          AppTexts.viewFeedsFooter,
          style: font400_14_white_Ts
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
        AppTexts.makeConnectionFooter,
          style: font400_14_white_Ts
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
         AppTexts.createCompanies,
          style:font400_14_white_Ts
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
         AppTexts.mobileApp,
          style: font400_14_white_Ts
        ),
      ],
    );
  }
  }
