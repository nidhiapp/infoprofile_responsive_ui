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
          style: font600_20_white_Ts
        ),
        const SizedBox(
          height: 18,
        ),
        Text(
          AppTexts.privacyPolicyFooter,
          style: font400_14_white_Ts
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
        AppTexts.termsConditionsFooter,
          style: font400_14_white_Ts
        ),
       
      ],
    );
  }
}