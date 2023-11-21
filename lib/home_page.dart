import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/view/background_widgets.dart/scroll_image.dart';
import 'package:info_profile_ui/view/widgets/appstore_playstore.dart';
import 'package:info_profile_ui/view/widgets/download_our_app_from.dart';
import 'package:info_profile_ui/view/widgets/footer_block/desktop_footer_block.dart';
import 'package:info_profile_ui/view/widgets/footer_block/mobile_footer_block.dart';
import 'package:info_profile_ui/view/widgets/footer_block/tablet_footer_block.dart';
import 'package:info_profile_ui/view/widgets/image_plus_text_below_blocks.dart';
import 'package:info_profile_ui/view/widgets/info_profile_is_designed.dart';
import 'package:info_profile_ui/view/widgets/infoprofile_logo.dart';
import 'package:info_profile_ui/view/widgets/login_card.dart';
import 'package:info_profile_ui/view/widgets/make_friends_building.dart';
import 'package:info_profile_ui/view/widgets/meet_your_best.dart';
import 'package:info_profile_ui/view/background_widgets.dart/upper_bg_rectangles.dart';
import 'package:info_profile_ui/view/widgets/try_info_profile_for_free.dart';
import 'package:info_profile_ui/view/widgets/visitingcrd_sharemedia_mltplpr.dart';

class CompleteSetUps extends StatelessWidget {
   CompleteSetUps({super.key});
final ScrollController sc = ScrollController();
  @override
  Widget build(BuildContext context) {
    
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return (w > 960)
        ? desktopCompleteSetUp(context)
        : (w > 450)
            ? tabletCompleteSetUp()
            : mobileCompleteSetUp();
  }

  Widget desktopCompleteSetUp(BuildContext context) {
    return SingleChildScrollView(
      controller: sc,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.bgGradientColor1,
              AppColors.bgGradientColor2,
              AppColors.bgGradientColor3,
            ],
          ),
        ),
        child: Column(
          children: [
            Stack(children: [
              const UpperBgRectangles(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          InfoProfileLogo.desktopInfoProfileLogo(),
                          SizedBox(
                            height: h * 0.2,
                          ),
                          MeetYourBestConnection.desktopMeetYrBestCon(),
                          SizedBox(
                            height: h * 0.02,
                          ),
                          AppleStorePlayStore.desktopAppleStorePlayStore(),
                          SizedBox(
                            height: h * 0.2,
                          ),
                        ],
                      ),
                      InkWell(onTap: (){
                              sc.animateTo(
                              
                                MediaQuery.of(context).size.height - 60,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                         
                          },
                        child: const ScrollImage())
                    ],
                  ),
                   SizedBox(
                  width: w*0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 112.0),
                    child: LoginCard.desktopLoginCard(),
                  )
                ],
              ),
            ]),
            SizedBox(
              height: h * 0.07,
            ),
            const InfoProfileIsDesigned(),
            SizedBox(
              height: h * 0.05,
            ),
            const VisitingcrdSharemediaMltplprof(),
            ImageplusText.desktopImageplusText(),
            DownloadOurAppFrom.desktopDownloadOurAppFrom(),
            MakeFriendsByBuilding.desktopMakeFriendsByBuilding(),
            Stack(alignment: Alignment.topCenter,
             children: [
              Column(
                children: [
                  SizedBox(
                    height: h * 0.03,
                  ),
                  const DesktopFooterSetUp()
                ],
              ),
              TryInfoProfileForFree.desktopTryInfoProfileForFree()
            ]),
          ],
        ),
      ),
    );
  }

//for tablet
  Widget tabletCompleteSetUp() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            AppColors.bgGradientColor1,
            AppColors.bgGradientColor2,
            AppColors.bgGradientColor3
          ])),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                UpperBgRectangles.tabletUpperBgRectangles(),
                Column(
                  children: [
                    InfoProfileLogo.tabletInfoProfileLogo(),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    MeetYourBestConnection.tabletMeetYrBestCon(),
                    LoginCard.tabletLoginCard()
                  ],
                )
              ],
            ),
            SizedBox(
              height: h * 0.07,
            ),
            AppleStorePlayStore.tabletAppleStorePlayStore(),
            SizedBox(
              height: h * 0.05,
            ),
            InfoProfileIsDesigned.tabletInfoProfileIsDesigned(),
            SizedBox(
              height: h * 0.06,
            ),
            const VisitingcrdSharemediaMltplprof(),
            SizedBox(
              height: h * 0.06,
            ),
            ImageplusText.tabletImageplusText(),
            SizedBox(
              height: h * 0.06,
            ),
            DownloadOurAppFrom.tabletDownloadOurAppFrom(),
            MakeFriendsByBuilding.tabletMakeFriendsByBuilding(),
            SizedBox(
              height: h * 0.08,
            ),
            Stack(alignment: Alignment.topCenter, children: [
              Column(
                children: [
                  SizedBox(
                    height: h * 0.13,
                  ),
                  const TabletFooter()
                ],
              ),
              TryInfoProfileForFree.tabletTryInfoProfileForFree(),
            ]),
          ],
        ),
      ),
    );
  }

//for mobile
  Widget mobileCompleteSetUp() {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            AppColors.bgGradientColor1,
            AppColors.bgGradientColor2,
            AppColors.bgGradientColor3
          ])),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                UpperBgRectangles.mobileUpperBgRectangles(),
                Column(
                  children: [
                    InfoProfileLogo.mobileInfoProfileLogo(),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    MeetYourBestConnection.mobileMeetYrBestCon(),
                    LoginCard.mobileLoginCard(),
                    SizedBox(
                      height: h * 0.07,
                    ),
                  ],
                )
              ],
            ),
            AppleStorePlayStore.mobileAppleStorePlayStore(),
            SizedBox(
              height: h * 0.05,
            ),
            InfoProfileIsDesigned.mobileInfoProfileIsDesigned(),
            SizedBox(
              height: h * 0.06,
            ),
            const VisitingcrdSharemediaMltplprof(),
            SizedBox(
              height: h * 0.06,
            ),
            ImageplusText.mobileImageplusText(),
            SizedBox(
              height: h * 0.06,
            ),
            DownloadOurAppFrom.mobileDownloadOurAppFrom(),
            MakeFriendsByBuilding.mobileMakeFriendsByBuilding(),
            SizedBox(
              height: h * 0.05,
            ),
            Stack(children: [
              Column(
                children: [
                  SizedBox(
                    height: h * 0.1,
                  ),
                  const MobileFooter()
                ],
              ),
              TryInfoProfileForFree.mobileTryInfoProfileForFree()
            ]),
          ],
        ),
      ),
    );
  }
}
