import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/company.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/feature.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/help_nd_support.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/info_profile_footer_logo.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/link.dart';
import 'package:info_profile_ui/view/widgets/footer_block/elements_in%20_footer/not_normal_app.dart';


class TabletFooter extends StatelessWidget {
  const TabletFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: AppColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0,left: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InfoProfileFooterLogo.tabletInfoProfileFooterLogo(),
                        const NotNormalApp(),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                            width: w * 0.13,
                            child: Image.asset(AppImages.socilaMedia)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30,),
                  Expanded(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Feature_Footer(),
                      SizedBox(
                        height: 25,
                      ),
                      LinkFooter()
                    ],
                    ),
                  ),
                                   const SizedBox(width: 20,),
                  Container(
                    height: 240,
                    width: 0.5,
                    color: AppColors.inbetweenContCol,
                  ),

                  const SizedBox(width: 20,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    CompanyFooter(),
                    SizedBox(
                      height: 25,
                    ),
                    HelpNdSupport()
                      ],
                    ),
                  ),
                  SizedBox(width: 5,)
                  
                
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 22.0, bottom: 8, top: 30),
                child: Container(
                  height: 0.5,
                  width: double.infinity,
                  color: AppColors.inbetweenContCol,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 0.0,
                  right: 22.0,
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
                              size: 13,
                            ),
                            Text(
                              AppTexts.copyright,
                              style: fontFourOneFourTs,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              AppTexts.allRightsReserved,
                              style: fontFourOneFourTs,
                            )))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
