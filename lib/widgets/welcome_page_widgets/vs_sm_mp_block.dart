import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class VsSmMpBlockContent extends StatefulWidget {
  late String icon;
 late var item;
   late var item2;
  @override
  VsSmMpBlockContent(
      {required this.icon, required this.item, required this.item2});

  @override
  State<VsSmMpBlockContent> createState() => _VsSmMpBlockContentState();
}

class _VsSmMpBlockContentState extends State<VsSmMpBlockContent> {
  Color icon = Colors.blue.shade900;
  Color headLineColor = Colors.blue.shade900;
  Color contentColor = Colors.black;
  Color container = Colors.transparent;
  Widget build(BuildContext context) {
    return Consumer<Providers>(
      builder: (context, value, child) {
        return MouseRegion(
          onEnter: (_) {
            icon = AppColors.nnHoverIconContCol;
            headLineColor = AppColors.logincardColor;
            contentColor = AppColors.onHovercontentText ;
            container = AppColors.primaryColor;
            value.updateOnHover();
           
          },
          onExit: (_) {
            icon = AppColors.primaryColor;
            headLineColor = AppColors.primaryColor;
            contentColor = AppColors.darkblackTextColor;
            container = Colors.transparent;
            value.updateOnHover();
           
          },
          child: Container(
          width: 380,
        height: 360,
            margin:  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            decoration: BoxDecoration(
                color: container, 
                borderRadius: BorderRadius.circular(10),
              //     boxShadow: [
              //   BoxShadow(
              //     color: value.isHovered?Colors.transparent: Color.fromRGBO(25, 55, 102, 0.25),
              //     offset:  value.isHovered?Offset(0,0):Offset(0, 30) ,
              //     blurRadius:value.isHovered?0:60,
              //     spreadRadius: 0,
              //   ),
              // ],
                ),
            padding:  const EdgeInsets.all(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: icon,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset(widget.icon),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  widget.item,
                 style: GoogleFonts.poppins(textStyle: TextStyle(color: headLineColor,
                fontWeight: FontWeight.w700, fontSize: 22),),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(widget.item2,
                style: GoogleFonts.poppins(textStyle: TextStyle(color: contentColor,
                fontWeight: FontWeight.w400, fontSize: 16),),
                    textAlign: TextAlign.start)
              ],
            ),
          ),
        );
      },
    );
  }
}
