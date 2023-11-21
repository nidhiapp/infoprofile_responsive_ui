import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/constants.dart';
class AppleStorePlayStore extends StatelessWidget {
  const AppleStorePlayStore({super.key});

  @override
  Widget build(BuildContext context) {
    return (w > 960)
        ? desktopAppleStorePlayStore()
        : (w > 450)
            ? tabletAppleStorePlayStore()
            : mobileAppleStorePlayStore();
 }

  static Widget desktopAppleStorePlayStore(){
    return   SizedBox(
        child: Row(
        children: [
          Image.asset(AppImages.appstoreimgs,height:67,width: 200,),
          const SizedBox(width: 18,),
          Image.asset(AppImages.googlePlay,height:67,width: 200,),
         
        ],
      ),
    );
  }
  static Widget tabletAppleStorePlayStore(){
    return   SizedBox(width: w*0.5,
        child: Row(
        children: [
          Expanded(child: Image.asset(AppImages.appstoreimgs,)),
           const SizedBox(width: 20,),
          Expanded(child: Image.asset(AppImages.googlePlay,)),
         
        ],
      ),
    );
  }
  static Widget mobileAppleStorePlayStore(){
    return   SizedBox(
        child: Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.appstoreimgs,height:h*0.03,width:w*0.35 ,),
          const SizedBox(width: 18,),
          Image.asset(AppImages.googlePlay,height:h*0.03,width:w*0.35,),
         
        ],
      ),
    );
  }
}