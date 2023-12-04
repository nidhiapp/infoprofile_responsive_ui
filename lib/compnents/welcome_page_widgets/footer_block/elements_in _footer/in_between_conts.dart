import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/constants.dart';
class InBetweenConts extends StatelessWidget {
  const InBetweenConts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h*0.15,
      width: 0.5,
      color: AppColors.inbetweenContCol,
    );
  }
}