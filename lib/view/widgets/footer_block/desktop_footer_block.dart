import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/company.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/feature.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/help_nd_support.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/in_between_conts.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/info_profile_footer_logo.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/link.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/not_normal_app.dart';
class DesktopFooterSetUp extends StatelessWidget {
  const DesktopFooterSetUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter,
      children: [
        SizedBox(width: double.infinity,
      height: 350,
        child: Image.asset(AppImages.footerimg,fit: BoxFit.fill,)),
        Positioned(
          child: Padding(
          padding: const EdgeInsets.only(top:120.0,
          ),
          child: Column(
        
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
                children: [SizedBox(width: 10,),
                  Expanded(flex:1,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoProfileFooterLogo.desktopInfoProfileFooterLogo(),
                        const NotNormalApp(),
                        const SizedBox(height: 10,),
                        SizedBox(width: w*0.13,
                          child: Image.asset(AppImages.socilaMedia))
                      ],
                    ),
                  ), 
                    const SizedBox(width: 40,),
                  Expanded(child: Feature_Footer()),
                      SizedBox(width: 20,),
                   InBetweenConts(),
                      SizedBox(width: 20,),
                Expanded(child: LinkFooter()),
                 SizedBox(width: 20,),
                    InBetweenConts(),
                    SizedBox(width: 20,),
                  Expanded(child: CompanyFooter()),
                  SizedBox(width: 20,),
                    InBetweenConts(),
                    SizedBox(width: 20,),
                  Expanded(child: HelpNdSupport()),
                  SizedBox(width: 20,),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left:20,right:20,bottom:8,top:30),
                child: Container( height: 0.5,
                  width: double.infinity,
                  color: AppColors.inbetweenContCol,),
              ),
              Padding(
                padding: const EdgeInsets.only(left:20.0,right: 20),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                  children: [
                 Row(
                   children: [
                    const Icon(Icons.copyright,color: AppColors.logincardColor,size: 13,),
                     Text(AppTexts.copyright,style: font400_14_white_Ts,),
                   ],
                 ),
                  Text(AppTexts.allRightsReserved,style: font400_14_white_Ts,),
                
                ],),
              ),
              SizedBox(height: 20,)
            ],
          ),
              ),
        ),]
    );
  }
}