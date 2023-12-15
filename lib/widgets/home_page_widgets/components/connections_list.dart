import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/base_provider.dart';
import 'package:provider/provider.dart';

class ConnectionsList extends StatelessWidget {
  const ConnectionsList(
      {super.key,
      // required this.connectionName,
      required this.uid,
      required this.name,
      required this.imageLink,
      required this.removeOnTap});
  //final String connectionName;
  final String uid;
  final String name;
  final String imageLink;
  final VoidCallback removeOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: AppColors.borderCol)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer<BaseProvider>(builder: (context, value, child) {
            return StreamBuilder(
              stream: FirebaseProfileRepository().getCurrentUserProfile(uid),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.goNamed(
                                        MyAppRouteConstants.profilePageRoute,
                                        pathParameters: {
                                          'uid': snapshot.data!.uid!,
                                        });
                                  },
                                  child: StreamBuilder(stream: FirebaseProfileRepository().getCurrentUserProfile(snapshot.data!.uid!),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.data != null) {
                                        return ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: snapshot.data!.image!,
                                            height: 33,
                                            width: 33,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                      else{
                                       return ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl: imageLink,
                                            height: 33,
                                            width: 33,
                                            fit: BoxFit.cover,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data!.name!,
                                      style: AppStyle.connectionTextName,
                                    ),
                                    Text(
                                      snapshot.data!.email!,
                                      style: AppStyle.connectionTextName,
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              debugPrint("remove on tap called");
                              removeOnTap();
                            },
                            child: FirebaseAuth.instance.currentUser!.uid != uid
                                ? Text(
                                    AppTexts.remove,
                                    style: AppStyle.connectionTextRemove,
                                  )
                                : const Text(""),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      )
                    ],
                  );
                } else {
                  return const Text(AppTexts.nofollower);
                }
              },
            );
          }),
        ),
      ),
    );
  }
}
