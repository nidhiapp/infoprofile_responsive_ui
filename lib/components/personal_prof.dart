import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/components/blue_circular_image.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class PersonalProfile extends StatelessWidget {
  const PersonalProfile({super.key, required this.uid});

  final String uid;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 450,
          //width: 1000,
          margin: EdgeInsets.symmetric(),
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            //border: Border.all(width: 1,color: AppColors.borderCol),
            color: AppColors.logincardColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10)),
          ),
          child: Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 35, horizontal: 30),
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderCol, width: 1.5)),
              child: StreamBuilder(
                stream: FirebaseProfileRepository().getCurrentUserProfile(uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot != null) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Profile",
                                  style: AppStyle.sixOneFourGreyTs,
                                ),
                                Text(
                                  snapshot.data!.name!,
                                  style: AppStyle.fontSixOneEightBlackTs,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          height: 2.5,
                          color: AppColors.lightGreyCol,
                          padding: EdgeInsets.symmetric(vertical: 10),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          AppTexts.about,
                          style: AppStyle.sixOneFourGreyTs,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_outlined,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data!.username!.length > 10
                                              ? "${snapshot.data!.username!.substring(0, 10)}..."
                                              : snapshot.data!.username!,
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.email_outlined,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Text(
                                            snapshot.data!.email!.length > 10
                                                ? snapshot.data!.email!
                                                        .substring(0, 15) +
                                                    "..."
                                                : snapshot.data!.email!,
                                            style:
                                                AppStyle.fontSixOneSixBlackTs(
                                                    context),
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.phone,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data!.mobile!,
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),

                              // SizedBox(height: 30,),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          formatMillisecondsSinceEpoch(int.parse( snapshot.data!.joinDate!,)),
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.people_outlined,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data!.followerList!.length
                                              .toString(),
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        ),
                                        Text(
                                          "      Follower",
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.people_outline,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data!.followingList!.length
                                              .toString(),
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        ),
                                        Text(
                                          "       Following",
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.image_sharp,
                                          color: AppColors.primaryColor,
                                          size: 28,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data!.postList!.length
                                              .toString(),
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        ),
                                      ],
                                    ),
                                     Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ImageIcon(AssetImage(AppImages.genderIcon),
                                        color: AppColors.primaryColor,),
                                       
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          snapshot.data!.gender!,
                                          style: AppStyle.fontSixOneSixBlackTs(
                                              context),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30,)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Center(child: Text("profile is not available"));
                  }
                },
              ),
            ),
            StreamBuilder(
              stream: FirebaseProfileRepository().getCurrentUserProfile(uid),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return CircularNetworkImage(
                      imageUrl: snapshot.data!.image.toString(),
                      height: 120,
                      width: 120);
                } else {
                  return CircularNetworkImage(
                      imageUrl: AppLink.defaultFemaleImg,
                      height: 120,
                      width: 120);
                }
              },
            ),
            Positioned(top: 80, left: 80, child: BlueCircularImage())
          ]),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          //width: 1000,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.logincardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.tagLine,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: AppColors.greyCol,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
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
              SizedBox(
                height: 10,
              ),
              StreamBuilder(
                stream: FirebaseProfileRepository().getCurrentUserProfile(uid),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                   
                    return Container(
                      // height: 300,width: 1000,
                      margin:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      padding:
                          EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.logincardColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: AppColors.borderCol, width: 1.5)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit_note_outlined,
                            color: AppColors.primaryColor,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                          snapshot.data!.about??"0000",
                            style: AppStyle.fontSixOneSixBlackTs(context),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox(
                      child: Text("bio not available"),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
