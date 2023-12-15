import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_profile_ui/models/notification_model.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/repository/notification.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/enums.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/search_dialog_box.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController searchController = TextEditingController();
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
            onTap: () {
              GoRouter.of(context).goNamed(MyAppRouteConstants.homePageRoute);
            },
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
                    AppTexts.home,
                    style: AppStyle.sixOneSixBlue,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: w * 0.01),

          const ImageIcon(
            AssetImage(AppImages.iconVisitingCard),
            color: AppColors.greyNormalTextColor,
          ),

          SizedBox(width: w * 0.3),

          // Search bar
          Expanded(
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.borderCol)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: AppColors.borderCol)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.borderCol, width: 2)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        const BorderSide(color: AppColors.borderCol, width: 2)),
                prefixIcon: InkWell(
                  onTap: () async {
                    String searchText = searchController.text.toString().trim();
                    if (searchText == null ||
                        searchText.isEmpty ||
                        searchText.length < 2) return;
                    FirebaseFeedRepo api = FirebaseFeedRepo();
                    ShowSearchDialog.showUserSearchDialog(context,
                        await api.searchUsers(searchText), api.followUser);
                  },
                  child: Icon(Icons.search,
                      size: w * 0.02, color: AppColors.borderCol),
                ),
              ),
            ),
          ),

          const SizedBox(
            width: 20,
          ),

          // Notification icon
          StreamBuilder<NotificationListModel?>(
              stream: getNotification(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  NotificationListModel res = snapshot.data!;
                  return InkWell(
                      onTap: () {
                        //AppCustomDialog();
                        showDialog(
                          context: context,
                          builder: (context) {
                            if (snapshot.hasData && snapshot.data != null) {
                              // final data =
                              //     snapshot.data as Map<String, dynamic>;
                              return AlertDialog(
                                content: Container(
                                  height: 400,
                                  width: 300,
                                  decoration: const BoxDecoration(
                                      color: AppColors.logincardColor),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ...List.generate(
                                            res.notificationList!.length,
                                            (index) {
                                          return ListTile(
                                            onTap: () {},
                                            title: StreamBuilder(
                                                stream: FirebaseFeedRepo()
                                                    .getUserData(
                                                        id: res
                                                            .notificationList![
                                                                index]
                                                            .sentById!
                                                            .toString()),
                                                builder: (context, snapshot) {
                                                  if (snapshot.hasData &&
                                                      snapshot.data != null) {
                                                    return Column(
                                                      children: [
                                                        Text(getNotificationWithType(
                                                                res.notificationList![
                                                                    index],
                                                                snapshot.data!
                                                                    .name) ??
                                                            ""),
                                                        const Divider(
                                                          height: 2,
                                                        )
                                                      ],
                                                    );
                                                  } else {
                                                    return Text(
                                                      getNotificationWithType(
                                                              res.notificationList![
                                                                  index],
                                                              null) ??
                                                          "",
                                                    );
                                                  }
                                                }),
                                          );
                                        })
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return const AlertDialog(
                                content: SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Center(
                                      child: Text("No Notification Found!")),
                                ),
                              );
                            }
                            // return NotificationPopUp().getNotificationPopup(context);
                          },
                        );
                      },
                      child: Image.asset(
                        AppImages.notificationIcon,
                        fit: BoxFit.fill,
                        height: 20,
                        width: 20,
                      ));
                } else {
                  return InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                height: 400,
                                width: 400,
                                decoration: const BoxDecoration(
                                    color: AppColors.logincardColor),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        AppImages.notificationIcon,
                                        fit: BoxFit.fill,
                                        height: 20,
                                        width: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    child: Image.asset(
                      AppImages.notificationIcon,
                      fit: BoxFit.fill,
                      height: 20,
                      width: 20,
                    ),
                  );
                }
              }),

          const SizedBox(
            width: 10,
          ),

          // Profile of user
          Consumer2<Providers, AuthProviders>(
            builder: (context, value, value2, child) {
              return PopupMenuButton<int>(
                itemBuilder: (context) => [
                  PopupMenuItem<int>(
                    value: 1,
                    child:
                        Text('Home', style: AppStyle.popUpconnectionTextName),
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
                      context.goNamed(MyAppRouteConstants.profilePageRoute,
                          pathParameters: {
                            'uid': FirebaseAuth.instance.currentUser!.uid,
                          });
                    },
                  ),
                  const PopupMenuDivider(),
                  PopupMenuItem<int>(
                    value: 3,
                    child:
                        Text('LogOut', style: AppStyle.popUpconnectionTextName),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: AppColors.logincardColor,
                            title: const Text(
                              AppTexts.logout,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            content: Text(AppTexts.areYouSure,
                                style: AppStyle.custompoppinNormalTs),
                            actions: [
                              TextButton(
                                child: const Text(AppTexts.no,
                                    style: TextStyle(color: Colors.black)),
                                onPressed: () {
                                  // Navigator.of(context)
                                  //     .pop(); // Close the dialog
                                },
                              ),
                              TextButton(
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () async {
                                  // Navigator.of(context).pop();
                             
                                  await value2.logout().then((value) {
                                    context.goNamed(
                                        MyAppRouteConstants.welcomePageRoute);
                                     Navigator.of(context).pop();
                                    if (value == true) {
                                      //provider.desktopLogin();
                                    }

                                  //  GoRouter.of(context).pushReplacementNamed(MyAppRouteConstants.welcomePageRoute);
                                  });
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
                offset: const Offset(0, 50),
                elevation: 2,
                child: StreamBuilder(
                  stream: FirebaseProfileRepository().getCurrentUserProfile(
                      FirebaseAuth.instance.currentUser?.uid ?? ""),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return CircularNetworkImage(
                        height: 50,
                        width: 50,
                        imageUrl: snapshot.data?.image ?? "",
                      );
                    } else {
                      return CircularNetworkImage(
                        height: 50,
                        width: 50,
                        imageUrl: AppLink.defaultFemaleImg,
                      );
                    }
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }

  getNotificationWithType(ApiNotification notification, String? name) {
    if (notification.type == NotificationType.follow) {
      return "${name ?? notification.activityId!.substring(0, 5)} ${notification.message} ";
    } else {
      return " ${notification.message} ${name ?? notification.activityId!.substring(0, 5)}";
    }
  }
}
