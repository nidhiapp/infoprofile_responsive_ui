import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/components/personal_prof.dart';
import 'package:info_profile_ui/components/user_posts.dart';
import 'package:info_profile_ui/utils/app_colors.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}



class _CustomTabBarState extends State<CustomTabBar> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(  
       padding: EdgeInsets.symmetric(vertical:14.0,horizontal:16.0),
      decoration: BoxDecoration(
         // color: AppColors.logincardColor,
          borderRadius: BorderRadius.circular(10)
          ),
      child: Column(
        children: [
          Container(
             padding: EdgeInsets.symmetric(vertical:14.0,horizontal:16.0),
             decoration: BoxDecoration(
        color: AppColors.logincardColor,
     
          //borderRadius: BorderRadius.circular(10)
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10),
          topRight: Radius.circular(10)
          )
          ),
            child: Column(
              children: [
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      buildTab("Profile", 0),
                      SizedBox(
                        width: 20,
                      ),
                      buildTab("Feeds", 1),
                    ],
                  ),
                ),
                Container(
              height: 3,
              color: AppColors.lightGreyCol,
              padding: EdgeInsets.symmetric(vertical: 10),
            ),
              ],
            ),
          ),
         
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: [
                // Profile Tab Content
    
                PersonalProfile(),
                // Feeds Tab Content
    
                ListView.builder(itemCount: 2,
                  itemBuilder: (context, int) {
                  return userPostConatiner();
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTab(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          //  borderRadius: BorderRadius.horizontal(right: Radius.circular(10),left: Radius.circular(10)),
          border: Border(
            bottom: BorderSide(
              color: _currentIndex == index
                  ? AppColors.primaryColor
                  : AppColors.transparent,
              width: 3,
            ),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
              color: _currentIndex == index
                  ? AppColors.blackNormalTextColor
                  : AppColors.greyCol,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
