import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/models/comment_model.dart';
import 'package:info_profile_ui/models/user_post_model.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/edit_profile.dart';

class CommentUserCard extends StatefulWidget {
  const CommentUserCard({super.key, required this.comment});
  final Comment comment;

  @override
  State<CommentUserCard> createState() => _CommentUserCardState();
}

class _CommentUserCardState extends State<CommentUserCard> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFeedApi().getUserData(id: widget.comment.commentedBy),
      builder: (context, snapshots) {
        if (snapshots.hasData && snapshots.data != null) {
                return Row(
                  children: [
                    CircularNetworkImage(
                      imageUrl: snapshots.data!.image ?? AppLink.defaultFemaleImg,
                      height: 46,
                      width: 46,
                    ),
                    SizedBox(
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
                                snapshots
                                    .data!.name.toString(),
                                style: AppStyle.fontSixOneSevenTs,
                              ),
                              Text(
                                formatMillisecondsSinceEpoch(int.parse(widget.comment.time!)),
                                style: AppStyle.sixOnezeroTs,
                              ),
                            ],
                          ),
                          Text(
                            widget.comment.comment!,
                            style: AppStyle.fontFiveOneOneTs,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              }
        else{
         return SizedBox();
        }
      },
    );
  }
}
