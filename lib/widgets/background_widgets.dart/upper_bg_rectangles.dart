import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/global.dart';

class UpperBgRectangles extends StatelessWidget {
  const UpperBgRectangles({super.key});

  @override
  Widget build(BuildContext context) {
      return (w > 960)
        ? desktopUpperBgRectangles()
        : (w > 450)
            ? tabletUpperBgRectangles()
            : mobileUpperBgRectangles();
   
  }

  //for desktop
 static Widget desktopUpperBgRectangles(){
    return  Row(crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    Expanded(
      child: Align(alignment: Alignment.topLeft,
        child: Image.asset(
          AppImages.leftrectangleimg,height: h*0.7,
        
          ),
      )),
    
     Expanded(
      child: Align(alignment: Alignment.topRight,
        child: Image.asset(
          AppImages.rightrectangleimg,fit: BoxFit.cover,
          height: 900,width:680
        
          
          ),
      ))
  ],

    );
  }

//for tablet
  static Widget tabletUpperBgRectangles() {
  return Stack(
    alignment: Alignment.topCenter,
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Image.asset(
          AppImages.leftrectangleimg,
          height: h * 0.9,
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          AppImages.rightrectangleimg,
           height: h * 1,
        ),
      ),
    ],
  );
}


 


//for mobile
static Widget mobileUpperBgRectangles(){
    return Stack(
    alignment: Alignment.topCenter,
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Image.asset(
          AppImages.leftrectangleimg,
          height: h * 0.9,
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Image.asset(
          AppImages.rightrectangleimg,
           height: h * 1,
        ),
      ),
    ],
  );
}
}

