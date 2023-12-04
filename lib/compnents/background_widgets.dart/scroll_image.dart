import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';

class ScrollImage extends StatelessWidget {
  const ScrollImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(height: 90, child: Image.asset(AppImages.roundrec)),
        SizedBox(
          height: 55,
          child: Column(
            children: [
              Expanded(
                  child: Image.asset(
                AppImages.frame4,
                width: 38,
                fit: BoxFit.cover,
              )),
              Expanded(
                  child: Image.asset(
                AppImages.frame4,
                width: 38,
                fit: BoxFit.cover,
              )),
              Expanded(
                  child: Image.asset(
                AppImages.frame3,
                 width: 38,
                fit: BoxFit.cover,
              )),
              Expanded(
                  child: Image.asset(
                AppImages.frame1,
                width: 38,
                fit: BoxFit.cover,
              )),
              Expanded(
                  child: Image.asset(
                AppImages.frame2,
                width: 20,
                fit: BoxFit.cover,
              )),
            ],
          ),
        )
      ],
    );
  }
}
