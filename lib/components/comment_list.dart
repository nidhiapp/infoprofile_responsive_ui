import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class CommentUserCard extends StatelessWidget {
  const CommentUserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularNetworkImage(
          imageUrl: AppLink.defaultFemaleImg,
          height: 46,
          width: 46,
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Anmol Kumar",
                    style: AppStyle.fontSixOneSevenTs,
                  ),
                  Text(
                    " 2 hours",
                    style: AppStyle.sixOnezeroTs,
                  ),
                ],
              ),
              Text(
                "Awesome bro... thats a nice place to do picnic ❤️",
                style: AppStyle.fontFiveOneOneTs,
              )
            ],
          ),
        ),
      ],
    );
  }
}
