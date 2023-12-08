import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/footer_block/elements_in%20_footer/company.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/footer_block/elements_in%20_footer/feature.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/footer_block/elements_in%20_footer/help_nd_support.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/footer_block/elements_in%20_footer/info_profile_footer_logo.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/footer_block/elements_in%20_footer/link.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/footer_block/elements_in%20_footer/not_normal_app.dart';
class MobileFooter extends StatelessWidget {
  const MobileFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: double.infinity,
        color: AppColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.only(top:160.0,left: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoProfileFooterLogo.mobileInfoProfileFooterLogo(),
      
            const NotNormalApp(),
             SizedBox(height: h*0.02,),
             SizedBox(width: w*0.5,
              child: Image.asset(AppImages.socilaMedia)),
             SizedBox(height: h*0.03,),
              const Feature_Footer(),
               SizedBox(height: h*0.03,),
              const LinkFooter(),
               SizedBox(height: h*0.03,),
              const CompanyFooter(),
               SizedBox(height: h*0.03,),
              const HelpNdSupport(),
               Padding(
                padding: const EdgeInsets.only(right: 20,
                  bottom: 8, top: 30,
                    ),
                child: Container(
                  height: 0.5,
                  width: double.infinity,
                  color: AppColors.inbetweenContCol,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                 // left: 2.0,
                  //right: 22.0,
                  bottom: 18,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.copyright,
                              color: AppColors.logincardColor,
                              size: 10,
                            ),
                            SizedBox(width: w*0.3,
                              child: Text(
                                AppTexts.copyright,
                                style:  AppStyle.fontFourOneFourWhitemobTs
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(width: w*0.3,
                              child: Text(
                                AppTexts.allRightsReserved,
                                style:  AppStyle.fontFourOneFourWhitemobTs,
                              ),
                            )))
                  ],
                ),
              )
          ],
        ),
      ));
  }
}