import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/models/comment_model.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_dialog_box.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/base_provider.dart';
import 'package:provider/provider.dart';

class CommentUserCard extends StatefulWidget {
  const CommentUserCard({super.key, required this.comment,});
  final Comment? comment;


  @override
  State<CommentUserCard> createState() => _CommentUserCardState();
}

class _CommentUserCardState extends State<CommentUserCard> {
  @override
  Widget build(BuildContext context) {
    String? prevComment = widget.comment?.comment;
    return StreamBuilder(
      stream: FirebaseFeedRepo().getUserData(id: widget.comment?.commentedBy),
      builder: (context, snapshots) {
        if (snapshots.hasData && snapshots.data != null) {
          return Row(
            children: [
              // const SizedBox(
              //   width: 40,
              // ),
              Expanded(
                child: Row(
                  children: [
                    StreamBuilder(
                      stream: FirebaseProfileRepository().getCurrentUserProfile(
                          widget.comment?.commentedBy),
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
                              Text(
                                formatMillisecondsSinceEpoch(
                                    int.parse(widget.comment?.time ?? "")),
                                style: AppStyle.sixOnezeroTs,
                              ),
                            ],
                          ),
                          Text(
                            widget.comment?.comment ?? "",
                            style: AppStyle.fiveOneFiveBlue,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              FirebaseAuth.instance.currentUser!.uid ==
                      widget.comment?.commentedBy
                  ? InkWell(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return CustomDialogBox(
                              content: "Do you want to delete this comment?",
                              title: "Delete comment",
                              onAction: (bool isConfirmed) async {
                                if (isConfirmed) {
                                  await FirebaseFeedRepo()
                                      .deleteComment(
                                          widget.comment ?? Comment(), context)
                                      .then((value) {});
                                  setState(() {});
                                  //  context.goNamed(MyAppRouteConstants.homePageRoute);
                                } else {}
                                setState(() {});
                              },
                            );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.delete_forever_outlined,
                        size: 20,
                        color: AppColors.bluishGrey,
                      ))
                  : const SizedBox(),
              const SizedBox(
                width: 10,
              ),
              FirebaseAuth.instance.currentUser!.uid ==
                      widget.comment?.commentedBy
                  ? Consumer<BaseProvider>(
                      builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: ((context) {
                                  String updatedComment =
                                      value.updateCont.text.toString().trim();
                                  return AlertDialog(
                                    content: TextFormField(
                                      initialValue: widget.comment?.comment,
                                      maxLines: null,
                                      onChanged: (value) =>
                                          updatedComment = value,
                                    ),
                                    actions: [
                                      InkWell(
                                        onTap: () async {
                                          widget.comment?.comment =
                                              updatedComment;
                                          await value
                                              .editComment(
                                                  widget.comment ?? Comment(),
                                                  context,
                                                  prevComment)
                                              .then((value) {});
                                          Navigator.pop(context);
                                        },
                                        child: Text(
                                          "edit",
                                          style: AppStyle.fiveOneFiveBlue,
                                        ),
                                      ),
                                    ],
                                  );
                                }));
                          },
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                            color: AppColors.bluishGrey,
                          ),
                        );
                      },
                    )
                  : const SizedBox(),
              // const SizedBox(
              //   width: 40,
              // )
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
