import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/global.dart';
class InfoProfileFooterLogo extends StatelessWidget {
  const InfoProfileFooterLogo({super.key});

  @override
  Widget build(BuildContext context) {

    return (w > 960)
        ? desktopInfoProfileFooterLogo()
        : (w > 450)
            ? tabletInfoProfileFooterLogo()
            : mobileInfoProfileFooterLogo();

    
  }
//for desktop
static Widget desktopInfoProfileFooterLogo(){
return Image.asset(AppImages.infoProfFooterLogo,height: h*0.1,);
}

//for tablet
static Widget tabletInfoProfileFooterLogo(){
return Image.asset(AppImages.infoProfFooterLogo,height: h*0.07,);
}

//for mobile
static Widget mobileInfoProfileFooterLogo(){
return Image.asset(AppImages.infoProfFooterLogo,height: h*0.06,);
}
}