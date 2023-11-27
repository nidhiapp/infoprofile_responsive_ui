import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view/background_widgets.dart/map_section_bg.dart';

class MakeFriendsByBuilding extends StatelessWidget {
  const MakeFriendsByBuilding({super.key});

  @override
  Widget build(BuildContext context) {
    return  (w > 960)
        ? desktopMakeFriendsByBuilding()
        : (w > 450)
            ? tabletMakeFriendsByBuilding()
            : mobileMakeFriendsByBuilding();
    
   
  }

  //for desktop
 static Widget desktopMakeFriendsByBuilding(){
 return   Stack(
   children: [const MapSectionBg(),
    Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.mapimg,
            //height: h * 0.5,
            width: w * 0.45,
          ),
          SizedBox(
              width: w * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    children: [
                      Text(
                        AppTexts.makeFriendsByBuilding,
                        style: font500_28Ts,
                      ),
                     
                    ],
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Wrap(children: [
                    Text(
                      AppTexts.theBestDomain,
                      style: imgtextcol,
                    )
                  ]),
                ],
              )),
        ],
      ),]
 );
  }




//for tablet
  static Widget tabletMakeFriendsByBuilding(){
 return   Column(
     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          AppImages.mapimg,
         height: h*0.5,width: w*0.8,
        ),
        SizedBox(
            width: w * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      AppTexts.be,
                      style: font500_28Ts,
                    ),
                    Text(
                      AppTexts.creative,
                      style: font500_28bluecolTs,
                    ),
                    Text(
                      AppTexts.inYourOwnWay,
                      style: font500_28Ts,
                    ),
                  ],
                ),
                 SizedBox(height: h*0.04,),
                Wrap(children: [
                  Text(
                    AppTexts.hereWeProduce,
                    style: imgtextcol,
                  )
                ]),
              ],
            )),
      ],
    );
  }



//for mobile
  static Widget mobileMakeFriendsByBuilding(){
 return   Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(
          AppImages.mapimg,
          //height: h * 0.7,
          width: w * 0.8,
        ),
        SizedBox(
            width: w * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    Text(
                      AppTexts.be,
                      style: font500_28Ts,
                    ),
                    Text(
                      AppTexts.creative,
                      style: font500_28bluecolTs,
                    ),
                    Text(
                      AppTexts.inYourOwnWay,
                      style: font500_28Ts,
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Wrap(children: [
                  Text(
                    AppTexts.hereWeProduce,
                    style: imgtextcol,
                  )
                ]),
              ],
            )),
      ],
    );
  }
}
