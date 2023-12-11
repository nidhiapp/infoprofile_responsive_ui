
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/components/personal_prof.dart';
import 'package:info_profile_ui/components/personal_prof_button.dart';
import 'package:info_profile_ui/components/user_posts.dart';
import 'package:info_profile_ui/models/user_profile.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';
import 'package:info_profile_ui/view_model/base_provider.dart';
import 'package:provider/provider.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key, required this.uid});
  final String uid;
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //  mainAxisSize: MainAxisSize.min,
              children: [
                PersonalProfButton(uid: widget.uid,
                  onPressed: () {}),
                InkWell(
                    onTap: () {
                       context.goNamed(
                                        MyAppRouteConstants.editProfilePageRoute,
                                        pathParameters: {
                                          'uid': FirebaseAuth.instance.currentUser!.uid,
                                        });;
                    },
                    child: _currentIndex == 0 && FirebaseAuth.instance.currentUser!.uid==widget.uid
                        ? Image.asset(
                            AppImages.editButton,
                            width: w * 0.07,
                            fit: BoxFit.cover,
                            height: h * 0.07,
                          )
                        : SizedBox()),
              ],
            ),
            SizedBox(
              height: 10,
            ),

            Container(
              padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 16.0),
              decoration: BoxDecoration(
                color: AppColors.logincardColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildTab(AppTexts.profile, 0),
                        SizedBox(width: 20),
                        buildTab(AppTexts.feeds, 1),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 3,
                    color: AppColors.lightGreyCol,
                    padding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ],
              ),
            ),

            // Profile Tab Content
            _currentIndex == 0
                ? PersonalProfile(
                    uid: widget.uid,
                  )
                :
                // Feeds Tab Content

                Consumer<BaseProvider>(
                    builder: (context, feedController, child) {
                      return StreamBuilder(
                        stream: feedController.getUserProfile(widget.uid),
                        builder: (context, snapshots) {
                          if (snapshots.hasData && snapshots.data != null) {
                            UserProfileModel posts = snapshots.data!;
                            return Column(
                              children: [
                                ...List.generate(
                                    snapshots.data!.postList!.length,
                                    (index) => Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 14.0, horizontal: 16.0),
                                          decoration: BoxDecoration(
                                            color: AppColors.logincardColor,
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                width: w * 0.06,
                                              ),
                                              Expanded(
                                                  child: StreamBuilder(
                                                      stream: FirebaseFeedApi()
                                                          .getCurrentPostDetails(
                                                              snapshots.data!
                                                                      .postList![
                                                                  index]),
                                                      builder:
                                                          (context, snapshot) {
                                                        if (snapshot.hasData &&
                                                            snapshot.data !=
                                                                null) {
                                                          return userPostConatiner(
                                                            post:
                                                                snapshot.data!,
                                                          );
                                                        } else {
                                                          return SizedBox();
                                                        }
                                                      })),
                                              SizedBox(
                                                width: w * 0.06,
                                              ),
                                            ],
                                          ),
                                        ))
                                // ListView.builder(
                                //   itemCount: 2,
                                //   itemBuilder: (context, index) {
                                //     return userPostConatiner();
                                //   },
                                // ),
                              ],
                            );
                          } else {
                            return SizedBox(
                              child: Text("there is no content"),
                            );
                          }
                        },
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: _currentIndex == index
                  ? AppColors.primaryColor
                  : AppColors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: _currentIndex == index
                  ? AppColors.blackNormalTextColor
                  : AppColors.greyCol,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
