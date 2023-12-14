import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
class BlueCircularImage extends StatelessWidget {
  const BlueCircularImage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                      height: 43,
                      width: 43,
                      decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 1.1097561120986938),
                                blurRadius: 23.304880142211914,
                                spreadRadius: 0,
                                color: AppColors.logincardColor)
                          ],
                          shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                       
                            child: Icon(
                          Icons.image_outlined,
                          color: AppColors.logincardColor,
                          size: 25,
                        )
                      ),
                    );
  }
}