import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/widgets/background_widgets.dart/dot_dot_rectangle.dart';

class DownloadOurAppFrom extends StatelessWidget {
  const DownloadOurAppFrom({super.key});

  @override
  Widget build(BuildContext context) {
    return (w > 960)
        ? desktopDownloadOurAppFrom()
        : (w > 450)
            ? tabletDownloadOurAppFrom()
            : mobileDownloadOurAppFrom();
  }

  static Widget desktopDownloadOurAppFrom(){
    return Stack(
  children: [
    SizedBox(
      width: double.infinity,
     height: 400,
      child: Image.asset(
        AppImages.dounloadAppBg,
        fit: BoxFit.fill,
      ),
    ),
    Positioned(
      top: 55, 
      left: 100, 
      right: 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppTexts.downloadOurApp, style:  AppStyle.fontSevenTwoSixTs),
                SizedBox(height: h * 0.03),
                Image.asset(AppImages.wayimg, ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              AppImages.downloadapppersonimg,
              height: h * 0.35,
              width: h * 0.35,
            ),
          ),
        ],
      ),
    ),
    const Positioned(
      child: DotRectangleBg()),
  ],
);

  }

 static  Widget tabletDownloadOurAppFrom(){
    return Stack(
      children:[ Padding(
        padding: const EdgeInsets.symmetric(vertical:20.0),
        child: Container(
          width: double.infinity,
            color: AppColors.primaryColor,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.downloadapppersonimg,
              height: h*0.45,width: h*0.45,),
              Text(AppTexts.downloadOurApp,style:  AppStyle.fontSevenTwoSixTs,),
               SizedBox(height: h*0.03,),
                SizedBox(width: w*0.9,
                  child: Image.asset(AppImages.wayimg)),
                 SizedBox(height: h*0.03,),
              ],
            ),
        ),
      ),
        DotRectangleBg.tabletDotRectangleBg(),
      ]
    );
  }

  static Widget mobileDownloadOurAppFrom(){
     return Stack(alignment: Alignment.topCenter,
      children:[ Padding(
        padding: const EdgeInsets.symmetric(vertical:20.0),
        child: Container(
          width: double.infinity,
            color: AppColors.primaryColor,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center,
            
              children: [
                Image.asset(AppImages.downloadapppersonimg,
              height: h*0.45,width: h*0.45,),
              Center(child: Text(AppTexts.downloadOurApp,style:  AppStyle.fontSevenTwoSixTs,)),
               SizedBox(height: h*0.03,),
               SizedBox(width: w*0.5,
                  child: Image.asset(AppImages.wayimg)),
                 SizedBox(height: h*0.05,),
              ],
            ),
        ),
      ),
       const DotRectangleBg(),
      ]
    );
  }
}
