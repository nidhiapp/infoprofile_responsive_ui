import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/constants.dart';
class DotRectangleBg extends StatelessWidget {
  const DotRectangleBg({super.key});

  @override
  Widget build(BuildContext context) {

 return (w > 960)
        ? desktopDotRectangleBg()
        : (w > 450)
            ? tabletDotRectangleBg()
            : mobileDotRectangleBg();


    
  }

  static Widget desktopDotRectangleBg(){
return Column(
      children: [
        Row(
       children: [
            Expanded(
              child: Align(alignment: Alignment.topLeft,
                child: Image.asset(AppImages.leftdotrecbg,height: 200,width: 230,fit: BoxFit.fill,)),
            )
          ],
        ),
        SizedBox(height: h*0.04,),
         Row(
          children: [
            Expanded(
              child: Align(alignment: Alignment.bottomRight,
                child: Image.asset(AppImages.rightdotrecbg,height:200,width: 230,fit: BoxFit.fill,)),
            )
          ],
        )
      ],
    );
  }



   static Widget tabletDotRectangleBg(){
return Column(
      children: [
        Row(
       children: [
            Expanded(
              child: Align(alignment: Alignment.topLeft,
                child: Image.asset(AppImages.leftdotrecbg,height: 250,width: 250,fit: BoxFit.fill,)),
            )
          ],
        ),
        SizedBox(height: h*0.2,),
         Row(
          children: [
            Expanded(
              child: Align(alignment: Alignment.bottomRight,
                child: Image.asset(AppImages.rightdotrecbg,height: 250,width: 250,fit: BoxFit.fill,)),
            )
          ],
        )
      ],
    );
  }


   static Widget mobileDotRectangleBg(){
return Column(
      children: [
        Row(
       children: [
            Expanded(
              child: Align(alignment: Alignment.topLeft,
                child: Image.asset(AppImages.leftdotrecbg,height: h*0.18,)),
            )
          ],
        ),
        SizedBox(height: h*0.3,),
         Row(
          children: [
            Expanded(
              child: Align(alignment: Alignment.bottomRight,
                child: Image.asset(AppImages.rightdotrecbg,height: h*0.18,)),
            )
          ],
        )
      ],
    );
  }
}