import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.logincardColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Row(
        children: [
          SizedBox(width: w * 0.02),
          // Logo of the company
          Image.asset(
            AppImages.infoProfilelogo,
            width: w * 0.15,
            fit: BoxFit.cover,
          ),

          SizedBox(width: w * 0.11),

          // Home icon
          InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                border: Border.all(
                  color: AppColors.borderCol,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    AppImages.homeIcon,
                    fit: BoxFit.fill,
                    height: 20,
                    width: 20,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Home',
                    style: AppStyle.sixOneSixBlue,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: w * 0.01),

          ImageIcon(
            AssetImage(AppImages.iconVisitingCard),
            color: AppColors.greyNormalTextColor,
          ),
          // List icons
          //  InkWell(
          //      onTap: () {},
          //      child: Image.asset(
          //        AppImages.iconVisitingCard, fit: BoxFit.fill,
          //        height: 55,
          //        width: 55,)
          //  ),

          SizedBox(width: w * 0.3),

          // Search bar
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.borderCol)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.borderCol)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.borderCol, width: 2)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.borderCol, width: 2)),
                prefixIcon: InkWell(
                  onTap: () async {
                    //   final users = await _myhomeRepo.getUsersExceptCurrentUser();
                    //  //  debugPrint("My email ${users.map((e){
                    //  //    return e.email.toString();})}");
                    //  //debugPrint("My emmais are ${users.iterator.moveNext().}");
                    //  for (var element in users) {debugPrint(element.email);}

                    //  // ignore: use_build_context_synchronously
                    //   Utils.showUserSearchDialog(context, users);
                  },
                  child: Icon(Icons.search,
                      size: w * 0.02, color: AppColors.borderCol),
                ),
              ),
            ),
          ),

          SizedBox(
            width: 20,
          ),

          // Notification icon
          InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('Notification Dialog'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image.asset(
                AppImages.notificationIcon,
                fit: BoxFit.fill,
                height: 20,
                width: 20,
              )),

          SizedBox(
            width: 10,
          ),

          // Profile of user
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem<int>(
                value: 1,
                child: Text('Home', style: AppStyle.popUpconnectionTextName),
                onTap: () {
                   context.goNamed(MyAppRouteConstants.homePageRoute);
                },
              ),
              const PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 2,
                child: Text('Your Profile',
                    style: AppStyle.popUpconnectionTextName),
                onTap: () {
                  context.goNamed(MyAppRouteConstants.profilePageRoute);
                },
              ),
              const PopupMenuDivider(),
              PopupMenuItem<int>(
                value: 3,
                child: Text('LogOut', style: AppStyle.popUpconnectionTextName),
              ),
            ],
            offset: const Offset(0, 50),
            elevation: 2,
            //  onSelected: (value) {
            //    if (value == 1) {
            //      print('Button 1');
            //    } else if (value == 2) {
            //      print('Button 2');
            //    } else if (value == 3) {
            //      print('Button 3');
            //    }
            //  },
            child: const CircleAvatar(
              backgroundColor: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}
