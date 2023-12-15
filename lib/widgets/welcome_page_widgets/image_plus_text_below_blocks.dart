import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/widgets/background_widgets.dart/overlapping_shapes_bg.dart';

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
                          Text(AppTexts.youCanCreate,style:  AppStyle.fontFiveTwoEightTs,),
                          Text(AppTexts.multipleProfile,style: AppStyle. font500_28bluecolTs,),
                          Text(AppTexts.forYourAccount,style:  AppStyle.fontFiveTwoEightTs,)
                        ],
                      ),
                      SizedBox(height: h*0.01,),
                      Wrap(children: [Text(AppTexts.domain,style: AppStyle.imgtextcol ,)]),
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
                          Text(AppTexts.be,style: AppStyle.fontFiveTwoEightTs,),
                          Text(AppTexts.creative,style: AppStyle.font500_28bluecolTs,),
                           Text(AppTexts.inYourOwnWay,style:AppStyle.fontFiveTwoEightTs,),
                         
                        ],
                      ),
                      SizedBox(height: h*0.01,),
                      Wrap(children: [Text(AppTexts.hereWeProduce,style: AppStyle.imgtextcol,)]),
                    ],
                  )),
                  const SizedBox(width: 20,)
                
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
                            Text(AppTexts.youCanCreate,style: AppStyle.fontFiveTwoEightTs,),
                            Text(AppTexts.multipleProfile,style: AppStyle.font500_28bluecolTs,),
                            Text(AppTexts.forYourAccount,style: AppStyle.fontFiveTwoEightTs,)
                          ],
                        ),
                          SizedBox(height: h*0.04,),
                         Wrap(children: [
                          Text(AppTexts.domain,style:AppStyle. imgtextcol,)]),
    
                         SizedBox(height: h*0.13,),
    
                         Image.asset(AppImages.creativeImg,height: h*0.5,width: w*0.8,),
                  SizedBox(width: w*0.6,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                             Text(AppTexts.be,style: AppStyle.fontFiveTwoEightTs,),
                             Text(AppTexts.creative,style: AppStyle.font500_28bluecolTs,),
                             Text(AppTexts.inYourOwnWay,style:AppStyle.fontFiveTwoEightTs,),
                           
                          ],
                        ),
                        SizedBox(height: h*0.04,),
                        Wrap(children: [Text(AppTexts.hereWeProduce,style: AppStyle.imgtextcol,)]),
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
                            Text(AppTexts.youCanCreate,style: AppStyle.fontFiveTwoEightTs,),
                            Text(AppTexts.multipleProfile,style: AppStyle.font500_28bluecolTs,),
                            Text(AppTexts.forYourAccount,style: AppStyle.fontFiveTwoEightTs,)
                          ],
                        ),
                          SizedBox(height: h*0.04,),
                         Wrap(children: [
                          Text(AppTexts.domain,style: AppStyle.imgtextcol,)]),
   
                         SizedBox(height: h*0.05,),
   
                         Image.asset(AppImages.creativeImg,height: h*0.3,),
                  SizedBox(width: w*0.6,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                          children: [
                             Text(AppTexts.be,style: AppStyle.fontFiveTwoEightTs,),
                             Text(AppTexts.creative,style: AppStyle.font500_28bluecolTs,),
                             Text(AppTexts.inYourOwnWay,style:AppStyle.fontFiveTwoEightTs,),
                           
                          ],
                        ),
                        SizedBox(height: h*0.04,),
                        Wrap(children: [Text(AppTexts.hereWeProduce,style:AppStyle.imgtextcol,)]),
                      ],
                    )),
                      ],
                    )),
                    
                 
        ],
      ),]
   );
  }
}
