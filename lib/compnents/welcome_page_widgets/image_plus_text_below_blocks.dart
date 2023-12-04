import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/compnents/background_widgets.dart/overlapping_shapes_bg.dart';

class ImageplusText extends StatelessWidget {
  const ImageplusText({super.key});

  @override
  Widget build(BuildContext context) {
    return (w > 960)
        ? desktopImageplusText()
        : (w > 450)
            ? tabletImageplusText()
            : mobileImageplusText();
  }
//for desktop
 static  Widget desktopImageplusText() {
    return Stack(
      children: [OverlappingShapesBg.desktopOverlappingShapesBg(),
        Column(
        children: [
          SizedBox(height: h*0.1,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                SizedBox(width: w*0.3,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(AppTexts.youCanCreate,style: font500_28Ts,),
                          Text(AppTexts.multipleProfile,style: font500_28bluecolTs,),
                          Text(AppTexts.forYourAccount,style: font500_28Ts,)
                        ],
                      ),
                      SizedBox(height: h*0.01,),
                      Wrap(children: [Text(AppTexts.domain,style: imgtextcol ,)]),
                    ],
                  )),
                Image.asset(AppImages.runPng,height: h*0.5,width: w*0.5,),
          ],),
           SizedBox(height: h*0.1,),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(AppImages.creativeImg,height: h*0.5,width: w*0.5,),
                SizedBox(width: w*0.3,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Wrap(
                        children: [
                          Text(AppTexts.be,style: font500_28Ts,),
                          Text(AppTexts.creative,style: font500_28bluecolTs,),
                           Text(AppTexts.inYourOwnWay,style:font500_28Ts,),
                         
                        ],
                      ),
                      SizedBox(height: h*0.01,),
                      Wrap(children: [Text(AppTexts.hereWeProduce,style: imgtextcol,)]),
                    ],
                  )),
                  SizedBox(width: 20,)
                
          ],),
          
        ],
      ),
      ]
    );
  }



 //for tablet
  static  Widget tabletImageplusText() {
    return Stack(alignment: Alignment.center,
      children: [
        OverlappingShapesBg.tabletOverlappingShapesBg(),
        Column(
        children: [
           Image.asset(AppImages.runPng,height: h*0.5,width: w*0.8,),
           SizedBox(height: h*0.07,),
          SizedBox(width: w*0.6,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(AppTexts.youCanCreate,style: font500_28Ts,),
                            Text(AppTexts.multipleProfile,style: font500_28bluecolTs,),
                            Text(AppTexts.forYourAccount,style: font500_28Ts,)
                          ],
                        ),
                          SizedBox(height: h*0.04,),
                         Wrap(children: [
                          Text(AppTexts.domain,style: imgtextcol,)]),
    
                         SizedBox(height: h*0.13,),
    
                         Image.asset(AppImages.creativeImg,height: h*0.5,width: w*0.8,),
                  SizedBox(width: w*0.6,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                             Text(AppTexts.be,style: font500_28Ts,),
                             Text(AppTexts.creative,style: font500_28bluecolTs,),
                             Text(AppTexts.inYourOwnWay,style:font500_28Ts,),
                           
                          ],
                        ),
                        SizedBox(height: h*0.04,),
                        Wrap(children: [Text(AppTexts.hereWeProduce,style: imgtextcol,)]),
                      ],
                    )),
                      ],
                    )),
                    
                 
        ],
      ),]
    );
  }


//for mobile
 static    Widget mobileImageplusText() {
   return Stack(alignment: Alignment.center,
     children: [OverlappingShapesBg.mobileOverlappingShapesBg(),
      Column(
        children: [
           Image.asset(AppImages.runPng,height: h*0.5,width: w*0.7,),
           SizedBox(height: h*0.07,),
          SizedBox(width: w*0.6,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                            Text(AppTexts.youCanCreate,style: font500_28Ts,),
                            Text(AppTexts.multipleProfile,style: font500_28bluecolTs,),
                            Text(AppTexts.forYourAccount,style: font500_28Ts,)
                          ],
                        ),
                          SizedBox(height: h*0.04,),
                         Wrap(children: [
                          Text(AppTexts.domain,style: imgtextcol,)]),
   
                         SizedBox(height: h*0.05,),
   
                         Image.asset(AppImages.creativeImg,height: h*0.3,),
                  SizedBox(width: w*0.6,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                             Text(AppTexts.be,style: font500_28Ts,),
                             Text(AppTexts.creative,style: font500_28bluecolTs,),
                             Text(AppTexts.inYourOwnWay,style:font500_28Ts,),
                           
                          ],
                        ),
                        SizedBox(height: h*0.04,),
                        Wrap(children: [Text(AppTexts.hereWeProduce,style:imgtextcol,)]),
                      ],
                    )),
                      ],
                    )),
                    
                 
        ],
      ),]
   );
  }
}
