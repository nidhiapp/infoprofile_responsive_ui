import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class PersonalProfButton extends StatelessWidget {
  final VoidCallback onPressed;
  String name;
  final String? uid;
  //final String imagePath;

  PersonalProfButton({
    Key? key,
    this.uid,
    required this.onPressed,
    this.name = "name",
    // required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: StreamBuilder(
          stream: FirebaseProfileRepository().getCurrentUserProfile(uid!),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: SizedBox(
                      child: CircularNetworkImage(
                        height: 40,
                        width: 40,
                        imageUrl: AppLink.defaultFemaleImg,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("person", style: AppStyle.fourOneFouroffWhiteColTs),
                      Text(snapshot.data!.name!,
                          style: AppStyle.sixOneSixwhite),
                    ],
                  ),
                  const SizedBox(width: 20),
                ],
              );
            } else {
             return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
