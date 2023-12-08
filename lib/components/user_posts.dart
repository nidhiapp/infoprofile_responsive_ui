import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/components/comment_list.dart';
import 'package:info_profile_ui/components/commentbox.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class userPostConatiner extends StatelessWidget {
  const userPostConatiner({super.key});

  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      decoration: BoxDecoration(
         border: Border.all(width: 1,color: AppColors.borderCol),
        color: AppColors.logincardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child:
                    CircularNetworkImage(
                  imageUrl: AppLink.defaultFemaleImg,
                  height: 45,
                  width: 45,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "name",
                    style: AppStyle.sixOneTwoTs,
                  ),
                  Text(
                    "time",
                    style: AppStyle.sixOnezeroTs,
                  )
                ],
              ), 
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "More effort is wasted doing things that don't matter than is wasted doing things inefficiently.",
            style: AppStyle.fiveOneFourTs,
          ),
          SizedBox(
            height: 15,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: AppLink.defaultFemaleImg,
              // height: 360,
              // width: 614,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              ImageIcon(
                AssetImage(AppImages.likeIcon),
              ),
              Text(
                "  120",
                style: AppStyle.sixOneFourGreyTs,
              ),
              SizedBox(
                width: 15,
              ),
              ImageIcon(
                AssetImage(AppImages.commentIcon),
              ),
              Text(
                " 120 ",
                style: AppStyle.sixOneFourGreyTs,
              ),
              SizedBox(
                width: 15,
              ),
              ImageIcon(
                AssetImage(AppImages.reportIcon),
              ),
              Text(
                "  ",
                style: AppStyle.sixOneFourGreyTs,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          //comment box 

          CommentBox(),
          SizedBox(
            height: 20,
          ),
          //comment user slide
          CommentUserCard()
        ],
      ),
    );
  }
}
