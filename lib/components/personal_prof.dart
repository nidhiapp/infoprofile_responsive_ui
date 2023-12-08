import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class PersonalProfile extends StatelessWidget {
  PersonalProfile(
      {super.key,
      this.userName = "nidhi_033 ",
      this.email = "nidhi@gmail.com ",
      this.followerList = "91 followers",
      this.mobileNum = "8967453422",
      this.followingList = "51 following ",
      this.joinedDate = "7 months ago",
      this.name = "nidhi tiwari",
      this.imgUrl = AppLink.defaultFemaleImg,
      this.postList = "21",
      this.bio="do good , be good"});

  String userName;
  String email;
  String name;
  String imgUrl;
  String mobileNum;
  String followerList;
  String followingList;
  String joinedDate;
  String postList;
  String bio;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
         height: 450,
        //width: 1000,
          margin: EdgeInsets.symmetric(),
      padding: EdgeInsets.symmetric( horizontal: 16),
      decoration: BoxDecoration(
         //border: Border.all(width: 1,color: AppColors.borderCol),
        color: AppColors.logincardColor,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)),
      ),
          child: Stack(children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderCol, width: 1.5)),
              child: Column(
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
                            name,
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
                    "About",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    userName,
                                    style: AppStyle.fontSixOneSixBlackTs,
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
                                  Text(
                                    email,
                                    style: AppStyle.fontSixOneSixBlackTs,
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
                                    mobileNum,
                                    style: AppStyle.fontSixOneSixBlackTs,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
    
                        // SizedBox(height: 30,),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    joinedDate,
                                    style: AppStyle.fontSixOneSixBlackTs,
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
                                    followingList,
                                    style: AppStyle.fontSixOneSixBlackTs,
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
                                    followerList,
                                    style: AppStyle.fontSixOneSixBlackTs,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    postList,
                                    style: AppStyle.fontSixOneSixBlackTs,
                                  ),
                                ],
                              ),
                             
                             
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
    
            
                ],
              ),
            ),
            CircularNetworkImage(imageUrl: imgUrl, height: 120, width: 120),
            Positioned(
                top: 80,
                left: 80,
                child: Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 1.1097561120986938),
                            blurRadius: 23.304880142211914,
                            spreadRadius: 0,
                            color: AppColors.logincardColor)
                      ],
                      shape: BoxShape.circle),
                  child: Center(
                      child: Icon(
                    Icons.image_outlined,
                    color: AppColors.logincardColor,
                    size: 30,
                  )),
                ))
          ]),
        ),
              SizedBox(height: 30,),
                
                
                  Container(
                     //width: 1000,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                  
                  color: AppColors.logincardColor,
                              borderRadius: BorderRadius.circular(10),
                              
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text("Tagline",
                           style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color:  AppColors.greyCol,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),),),
                            SizedBox(height: 10,),
                        Container( 
                         // height: 300,width: 1000,
                         margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                            padding: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                                decoration: BoxDecoration(color: AppColors.logincardColor,
                                  borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.borderCol, width: 1.5)),
                        child: Row(
                  children: [Icon(Icons.edit_note_outlined,
                  color: AppColors.primaryColor,
                  size: 30,
                  ),
                  SizedBox(width: 10,),
                        Text(bio, style: AppStyle.fontSixOneSixBlackTs,),
                  ],
                        ),
                        ),
                      ],
                    ),
                  ),
                  
      ],
    );
  }
}
