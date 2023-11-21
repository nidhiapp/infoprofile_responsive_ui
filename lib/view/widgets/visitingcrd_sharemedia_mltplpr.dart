import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/vs_sm_mp_block.dart';


class VisitingcrdSharemediaMltplprof extends StatelessWidget {
  const VisitingcrdSharemediaMltplprof({super.key});

  @override
  Widget build(BuildContext context) {
   return Wrap(spacing: 10,
   runSpacing: 10,
   runAlignment:WrapAlignment.start,
    children: [
     VsSmMpBlockContent(
      icon: AppImages.iconVisitingCard,
         item: AppTexts.visitingCard,
         item2:AppTexts.shareYourVisiting),
         const SizedBox(width: 20,),
     VsSmMpBlockContent(
       icon: AppImages.iconShareMedia,
         item: AppTexts.shareMedia,
         item2:AppTexts.shareYourFavourite),
           const SizedBox(width: 20,),
     VsSmMpBlockContent(
       icon: AppImages.iconMultipleProf,
         item: AppTexts.multipleProfile,
         item2: AppTexts.youCanChoose)
   ]);
  }
}
