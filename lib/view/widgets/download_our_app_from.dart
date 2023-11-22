import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view/background_widgets.dart/dot_dot_rectangle.dart';

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
        "/Users/admin/Desktop/info_profile_ui/assets/images/downloadourappbg.png",
        fit: BoxFit.fill,
      ),
    ),
    Positioned(
      top: 55, // Adjust the top position as needed
      left: 100, // Adjust the left position as needed
      right: 0.5, // Adjust the right position as needed
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppTexts.downloadOurApp, style: font700_28Ts),
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
    Positioned(
      child: const DotRectangleBg()),
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
              Text(AppTexts.downloadOurApp,style: font700_28Ts,),
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
              Center(child: Text(AppTexts.downloadOurApp,style: font700_28Ts,)),
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
