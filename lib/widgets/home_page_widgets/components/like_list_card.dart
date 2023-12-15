import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';

import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';



class LikeUserCard extends StatefulWidget {
  const LikeUserCard({super.key, required this.id});
  final String id;

  @override
  State<LikeUserCard> createState() => _LikeUserCardState();
}

class _LikeUserCardState extends State<LikeUserCard> {
  @override
  Widget build(BuildContext context) {
    //String? prevComment = ;
    return StreamBuilder(
        stream: FirebaseFeedRepo().getUserData(id: widget.id),
        builder: (context, snapshots) {
          if (snapshots.hasData && snapshots.data != null) {
            return Row(children: [
              // const SizedBox(
              //   width: 40,
              // ),
              Expanded(
                child: Row(
                  children: [
                    StreamBuilder(
                      stream: FirebaseProfileRepository().getCurrentUserProfile(
                          FirebaseAuth.instance.currentUser!.uid),
                      builder: (context, snapshot) {
                        if (snapshot.hasData && snapshot.data != null) {
                          return CircularNetworkImage(
                            imageUrl: snapshot.data!.image!,
                            height: 46,
                            width: 46,
                          );
                        } else {
                          return CircularNetworkImage(
                            imageUrl: AppLink.defaultFemaleImg,
                            height: 46,
                            width: 46,
                          );
                        }
                      },
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                snapshots.data!.name.toString(),
                                style: AppStyle.fontSixOneSevenTs,
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]);
          } else {
            return const Text("nolikes");
          }
        });
  }
}
