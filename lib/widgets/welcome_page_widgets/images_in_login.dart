import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/global.dart';

class ImagesInLogin extends StatelessWidget {
  const ImagesInLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: Image.asset(
            AppImages.fbimg,
            height: h * 0.04,
            width: w * 0.057,
          )),
          Expanded(
              child: Image.asset(
            AppImages.googly,
            height: h * 0.04,
            width: w * 0.057,
          )),
          Expanded(
              child: Image.asset(
            AppImages.linkimg,
            height: h * 0.04,
            width: w * 0.057,
          )),
          Expanded(
              child: Image.asset(
            AppImages.appleimg,
            height: h * 0.04,
            width: w * 0.057,
          ))
        ],
      ),
    );
  }
}
