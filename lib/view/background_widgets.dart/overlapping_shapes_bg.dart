import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/constants.dart';
class OverlappingShapesBg extends StatelessWidget {
  const OverlappingShapesBg({super.key});

  @override
  Widget build(BuildContext context) {
    return (w > 960)
        ? desktopOverlappingShapesBg()
        : (w > 450)
            ? tabletOverlappingShapesBg()
            : mobileOverlappingShapesBg();
  }

  //for desktop
 static  Widget desktopOverlappingShapesBg(){
     return  Column(
       children: [
         Row(
         children: [ Expanded(
          child: Align(alignment: Alignment.topLeft,
            child: Image.asset(
              AppImages.doubleoverlapciclebg,height: h*0.6,
            
              ),
          )),
    ], ),
      Row(
         children: [ Expanded(
          child: Align(alignment: Alignment.bottomRight,
            child: Image.asset(
              AppImages.doblerecoverlapbg,height: h*0.6,
            
              ),
          )),
    ], ),
    
       ],
     );
  }

  //For tablet
  static  Widget tabletOverlappingShapesBg(){
 return  Column(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Align(alignment: Alignment.topLeft,
            child: Image.asset(
              AppImages.doubleoverlapciclebg,height: h*0.5,
            
              ),
          )),
      ],
    ),
    SizedBox(height: h*0.6,),
     Row(mainAxisAlignment: MainAxisAlignment.end,
       children: [
         Expanded(
          child: Align(alignment: Alignment.topRight,
            child: Image.asset(
              AppImages.doblerecoverlapbg,
              height: h*0.8,
            
              
              ),
          )),
       ],
     )
  ],

    );
  }


  //for mobile
  static  Widget mobileOverlappingShapesBg(){
     return  Column(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Row(mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Align(alignment: Alignment.topLeft,
            child: Image.asset(
              AppImages.doubleoverlapciclebg,height: h*0.5,
            
              ),
          )),
      ],
    ),
    SizedBox(height: h*0.5,),
     Row(mainAxisAlignment: MainAxisAlignment.end,
       children: [
         Expanded(
          child: Align(alignment: Alignment.topRight,
            child: Image.asset(
              AppImages.doblerecoverlapbg,
              height: h*0.7,
            
              
              ),
          )),
       ],
     )
  ],

    );
  }
}