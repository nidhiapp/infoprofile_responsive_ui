import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
class LinkFooter extends StatelessWidget {
  const LinkFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          AppTexts.linksFooter,
          style: fontSixTwoZeroWhiteTs 
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          AppTexts.privacyPolicyFooter,
          style: fontFourOneFourTs
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
        AppTexts.termsConditionsFooter,
          style: fontFourOneFourTs
        ),
       
      ],
    );
  }
}