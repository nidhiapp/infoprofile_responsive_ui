import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/appstore_playstore.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/base_page.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/download_our_app_from.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/footer_block/mobile_footer_block.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/footer_block/tablet_footer_block.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/image_plus_text_below_blocks.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/info_profile_is_designed.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/infoprofile_logo.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/onboarding/login_card.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/make_friends_building.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/meet_your_best.dart';
import 'package:info_profile_ui/widgets/background_widgets.dart/upper_bg_rectangles.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/onboarding/otp_page.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/try_info_profile_for_free.dart';
import 'package:info_profile_ui/widgets/welcome_page_widgets/visitingcrd_sharemedia_mltplpr.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:provider/provider.dart';
import '../services/auth_services.dart';
import '../widgets/background_widgets.dart/scroll_image.dart';
import '../widgets/welcome_page_widgets/footer_block/desktop_footer_block.dart';
import '../widgets/welcome_page_widgets/onboarding/forget_pass.dart';
import '../widgets/welcome_page_widgets/onboarding/login_phone_num.dart';
import '../widgets/welcome_page_widgets/onboarding/reset_password.dart';
import '../widgets/welcome_page_widgets/onboarding/sign_up_card.dart';
import '../view_model/provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final ScrollController sc = ScrollController();

  @override
  void initState() {
    super.initState();
    loadState();
  }

  loadState() async {
    await AuthServices().isUserAlreadyLogin().then((value) {
      if (value == true) {}
    }).onError((error, stackTrace) {});
  }

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: (w > 960)
          ? desktopCompleteSetUp(context)
          : (w > 450)
              ? tabletCompleteSetUp()
              : mobileCompleteSetUp(),
    );
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
        child: Consumer<Providers>(
          builder: (context, provider, child) {
            return Column(
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
                                height: h * 0.16,
                              ),
                              MeetYourBestConnection.desktopMeetYrBestCon(),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              AppleStorePlayStore.desktopAppleStorePlayStore(),
                              SizedBox(
                                height: h * 0.15,
                              ),
                            ],
                          ),
                          InkWell(
                              onTap: () {
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
                        width: w * 0.04,
                      ),

                      /// All the Container are here [SignUpCard] [OtpPage] [ForgetPassword] [ResetPassword] [LoginUsingPhone]
                      Padding(
                        padding: const EdgeInsets.only(top: 112.0),
                        child: Column(
                          children: [
                            if (provider.index == 0)
                              LoginCard.desktopLoginCard(),
                            if (provider.index == 1) const SignUpCard(),
                            if (provider.index == 2) const OtpPage(),
                            if (provider.index == 4) const ForgetPassword(),
                            if (provider.index == 5) const ResetPassword(),
                            if (provider.index == 3) const LoginUsingPhone(),
                            //if (provider.index == 6) const BasePage(),
                          ],
                        ),
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
                const DesktopFooterSetUp()
              ],
            );
          },
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
        child: Consumer<Providers>(
          builder: (context, provider, child) {
            return Column(
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
                        //LoginCard.tabletLoginCard()
                        if (provider.index == 0) LoginCard.tabletLoginCard(),
                        if (provider.index == 1) const SignUpCard(),
                        if (provider.index == 2) const OtpPage(),
                        if (provider.index == 4) const ForgetPassword(),
                        if (provider.index == 5) const ResetPassword(),
                        if (provider.index == 3) LoginUsingPhone(),
                       // if (provider.index == 6) BasePage(),
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
            );
          },
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
        child: Consumer<Providers>(
          builder: (context, provider, child) {
            return Column(
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
                        // LoginCard.mobileLoginCard(),
                        if (provider.index == 0) LoginCard.mobileLoginCard(),
                        if (provider.index == 1) const SignUpCard(),
                        if (provider.index == 2) const OtpPage(),
                        if (provider.index == 4) const ForgetPassword(),
                        if (provider.index == 5) const ResetPassword(),
                        if (provider.index == 3) LoginUsingPhone(),
                       // if (provider.index == 6) BasePage(),

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
                        height: h * 0.15,
                      ),
                      const MobileFooter()
                    ],
                  ),
                  TryInfoProfileForFree.mobileTryInfoProfileForFree()
                ]),
              ],
            );
          },
        ),
      ),
    );
  }
}
