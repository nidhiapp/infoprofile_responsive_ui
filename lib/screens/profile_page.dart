import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/components/connections_list.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_app_bar.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_tab_bar.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint("uidd of user is${widget.uid}");
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: -20,
            child: Image.asset(
              AppImages.homePageBg,
              width: w * 1,
              fit: BoxFit.cover,
            ),
          ),

          // Body App Bar
          CustomAppBar(),

          // Remaining Content
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 15, right: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spa,
                children: [
                  const SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            constraints: const BoxConstraints(),
                            decoration: BoxDecoration(
                              color: AppColors.logincardColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: AppColors.borderCol),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppTexts.follower,
                                      style: AppStyle.connectionHeader),
                                  Expanded(
                                      child: StreamBuilder(
                                    stream: FirebaseProfileRepository()
                                        .getCurrentUserProfile(widget.uid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.data != null) {
                                        if (snapshot .data!.followerList?.length ==0) {
                                          return Image.asset(  AppImages.emptyImg);
                                        }
                                        return ListView.builder(
                                            itemCount: snapshot.data!
                                                    .followerList!.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return ConnectionsList(
                                                imageLink:
                                                    AppLink.defaultFemaleImg,
                                                uid: snapshot.data!
                                                    .followerList![index],
                                                name: snapshot.data!.email!,
                                                removeOnTap: () {
                                                     FirebaseProfileRepository().removeFollower(uid:
                                                          snapshot.data!
                                                        .followerList![index]);
                                                },
                                              );
                                            });
                                      } else {
                                        return Text("no follower found");
                                      }
                                    },
                                  )),
                                  Center(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            AppTexts.viewAll,
                                            style: AppStyle.connectionText,
                                          )))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            constraints: const BoxConstraints(),
                            decoration: BoxDecoration(
                                color: AppColors.logincardColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: AppColors.borderCol)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppTexts.following,
                                      style: AppStyle.connectionHeader),
                                  Expanded(
                                      child:
                                          //   EmptyConnectionsListBox()
                                          StreamBuilder(
                                    stream: FirebaseProfileRepository()
                                        .getCurrentUserProfile(widget.uid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.data != null) {
                                        if (snapshot
                                                .data!.followingList!.length ==
                                            0) {
                                          return Image.asset(
                                              AppImages.emptyImg);
                                        }
                                        return ListView.builder(
                                            itemCount: snapshot.data!
                                                    .followingList!.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return ConnectionsList(
                                                imageLink: AppLink.defaultFemaleImg,
                                                uid: snapshot.data!
                                                    .followingList![index],
                                                name: snapshot.data!.email!,
                                                removeOnTap: () {
                                                     FirebaseProfileRepository().removeFollowing(uid:
                                                          snapshot.data!
                                                        .followingList![index]);
                                                },
                                              );
                                            });
                                      } else {
                                        return Text("no following found");
                                      }
                                    },
                                  )
                                  ),
                                  Center(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            AppTexts.viewAll,
                                            style: AppStyle.connectionText,
                                          )))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    flex: 5,
                    child: CustomTabBar(uid: widget.uid,),
                  ),
                  const SizedBox(
                    width: 35,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
