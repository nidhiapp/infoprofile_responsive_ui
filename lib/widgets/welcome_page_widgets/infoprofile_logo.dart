import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/global.dart';
class InfoProfileLogo extends StatelessWidget {
  const InfoProfileLogo({super.key});

  @override
  Widget build(BuildContext context) {
     return (w > 960)
        ? desktopInfoProfileLogo()
        : (w > 450)
            ? tabletInfoProfileLogo()
            : mobileInfoProfileLogo();
   
  }
  static Widget desktopInfoProfileLogo(){
  return Image.asset(AppImages.infoProfilelogo,height: h*0.06,);
  }

   static Widget tabletInfoProfileLogo(){
  return Image.asset(AppImages.infoProfilelogo,height: h*0.08,);
  }

   static Widget mobileInfoProfileLogo(){
  return Image.asset(AppImages.infoProfilelogo,height: h*0.06,);
  }
}