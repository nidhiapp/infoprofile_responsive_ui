import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class MeetYourBestConnection extends StatelessWidget {
  const MeetYourBestConnection({super.key});

  @override
  Widget build(BuildContext context) {
     return (w > 960)
        ? desktopMeetYrBestCon()
        : (w > 450)
            ? tabletMeetYrBestCon()
            : mobileMeetYrBestCon();
    
  }
  static Widget desktopMeetYrBestCon(){
     return Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppTexts.meetYourBest,style:AppStyle.meetYourbestTs,),
        Text(AppTexts.connections,style: AppStyle.connectionsTs,),
         Text(AppTexts.buildFast,style: AppStyle.buildfastTs,)

       
       
      ],
    );

  }

   static Widget tabletMeetYrBestCon(){
     return Column(crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(AppTexts.meetYourBest,style:AppStyle.meetYourbestTs,),
        Text(AppTexts.connections,style: AppStyle.connectionsTs,),
         SizedBox(height: h * 0.02,),
        Text(AppTexts.buildFast,style: AppStyle.buildfastTs,),
         SizedBox(height: h * 0.07,),
      ],
    );

  }
  static Widget mobileMeetYrBestCon(){
     return Column(crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppTexts.meetYourBest,style:AppStyle.meetYourbestmobTs,),
        Text(AppTexts.connections,style: AppStyle.connectionsmobTs,),
             SizedBox(height: h * 0.02,),
        Text(AppTexts.buildFast,style: AppStyle.buildfastTs,textAlign: TextAlign.center,),
        SizedBox(height: h * 0.07,),
    
      ],
    );

  }

 
}
