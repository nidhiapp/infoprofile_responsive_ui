import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget? child;
  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;

  const CustomContainer({
    Key? key,
    this.child,
    this.height = 400,
    this.width = 600,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.logincardColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 21,
            spreadRadius: 0,
            color: Color.fromRGBO(0, 0, 0, 0.02),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

