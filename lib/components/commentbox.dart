import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class CommentBox extends StatelessWidget {
  const CommentBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TextFormField(
            style: AppStyle.custompoppinNormalTs,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
                child: ClipOval(
                    child: CircularNetworkImage(
                  imageUrl: AppLink.defaultFemaleImg,
                  height: 20,
                  width: 20,
                )),
              ),
              hintStyle: AppStyle.sixOnezeroTs,
              hintText: "write your comments here",
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.borderCol, width: 1)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: AppColors.borderCol, width: 1)),
            ),
            maxLines: null,
          ),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: CircleAvatar(
                radius: 28,
                backgroundColor: AppColors.primaryColor,
                child: ImageIcon(
                  AssetImage(
                    AppImages.sendIcon,
                  ),
                  size: w*0.02,
                  color: AppColors.logincardColor,
                )))
      ],
    );
  }
}
