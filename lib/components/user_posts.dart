import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:info_profile_ui/components/comment_list.dart';
import 'package:info_profile_ui/components/commentbox.dart';
import 'package:info_profile_ui/models/comment_model.dart';
import 'package:info_profile_ui/models/post_like.dart';
import 'package:info_profile_ui/models/user_post_model.dart';
import 'package:info_profile_ui/repository/feed/feed_apis.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/routes/app_routes_constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_dialog_box.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/base_provider.dart';
import 'package:info_profile_ui/view_model/comment_controller.dart';
import 'package:info_profile_ui/view_model/edit_profile.dart';
import 'package:info_profile_ui/view_model/like_dislike.dart';
import 'package:provider/provider.dart';

class userPostConatiner extends StatefulWidget {
  const userPostConatiner({
    super.key,
    required this.post,
  });
  final PostModel post;
  //final int index;

  @override
  State<userPostConatiner> createState() => _userPostConatinerState();
}

class _userPostConatinerState extends State<userPostConatiner> {
  bool showAllComments = false;
  final LikeDislikeApis _likeDislikeApis = LikeDislikeApis();
  final TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String? prevDes = widget.post.description;
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;
    return Consumer<BaseProvider>(builder: (context, baseProvider, child) {
      debugPrint(
          "Post Image link of id ${widget.post.postId} is ${widget.post.imageLink!}");
      return Container(
        margin: EdgeInsets.symmetric(vertical: 6),
        padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.borderCol),
          color: AppColors.logincardColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamBuilder(
              stream: EditProfileProvider()
                  .getUserDetails(id: widget.post.postedBy),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipOval(
                            child: CircularNetworkImage(
                              imageUrl: widget.post.userProfileImage == true
                                  ? widget.post.imageLink.toString()
                                  : AppLink.defaultFemaleImg,
                              height: 45,
                              width: 45,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data!.username!,
                                style: AppStyle.sixOneTwoTs,
                              ),
                              Text(
                                formatMillisecondsSinceEpoch(
                                    int.parse(widget.post.time!)),
                                style: AppStyle.sixOnezeroTs,
                              )
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return CustomDialogBox(
                                      content:
                                          "Do you want to delete this post?",
                                      title: "Delete Post",
                                      onAction: (bool isConfirmed) {
                                        if (isConfirmed) {
                                          setState(() {});
                                          FirebaseFeedRepo().deletePost(
                                              widget.post.postId!, context);
                                          //  context.goNamed(MyAppRouteConstants.homePageRoute);
                                        } else {}
                                      },
                                    );
                                  },
                                );

                                // baseProvider.deletePost(
                                //     widget.post.postId!);
                              },
                              child: FirebaseAuth.instance.currentUser!.uid ==
                                      widget.post.postedBy
                                  ? Icon(
                                      Icons.delete_outline,
                                      size: 23,
                                    )
                                  : SizedBox()),
                          Consumer<BaseProvider>(
                            builder: (context, value, child) {
                              if (FirebaseAuth.instance.currentUser!.uid ==
                                  widget.post.postedBy) {
                                return InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: ((context) {
                                            String updatedDes = value
                                                .updateCont.text
                                                .toString()
                                                .trim();
                                            return AlertDialog(
                                              content: TextFormField(
                                                initialValue:
                                                    widget.post.description,
                                                maxLines: null,
                                                onChanged: (value) =>
                                                    updatedDes = value,
                                              ),
                                              actions: [
                                                InkWell(
                                                  onTap: () async {
                                                    widget.post.description =
                                                        updatedDes;
                                                    // setState(() {

                                                    // });
                                                    await value
                                                        .editPost(widget.post,
                                                            context, prevDes)
                                                        .then((value) {});
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    "edit",
                                                    style: AppStyle
                                                        .fiveOneFiveBlue,
                                                  ),
                                                ),
                                              ],
                                            );
                                          }));
                                    },
                                    child: Icon(Icons.edit));
                              } else {
                                return SizedBox();
                              }
                            },
                          )
                        ],
                      ),
                    ],
                  );
                } else {
                  return SizedBox();
                }
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.post.description!,
              style: AppStyle.fiveOneFourTs,
            ),
            SizedBox(
              height: 15,
            ),
            widget.post.imageLink!.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: widget.post.imageLink!,
                      // height: 360,
                      // width: 614,
                      fit: BoxFit.fill,
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                StreamBuilder<PostLikeModel?>(
                  stream: FirebaseFeedRepo()
                      .getPostLikeList(postId: widget.post.postId!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      bool isLikedByMe = snapshot.data!.likeList!
                          .contains(FirebaseAuth.instance.currentUser!.uid);
                      return Row(children: [
                        InkWell(
                          onTap: () {
                            isLikedByMe
                                ? _likeDislikeApis.addDisLike(
                                    postId: widget.post.postId!,
                                  )
                                : _likeDislikeApis.addLike(
                                    postId: widget.post.postId!,
                                    postedBy: widget.post.postedBy!);
                          },
                          child: ImageIcon(
                            AssetImage(
                              AppImages.likeIcon,
                            ),
                            color: isLikedByMe ? AppColors.primaryColor : null,
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        InkWell(
                          onTap: () {
                            void _showAllLikes(BuildContext context) {
                              PostLikeModel listModel = snapshot.data!;
                              showModalBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return ListView.builder(
                                    itemCount: listModel.likeList!.length,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      CachedNetworkImage(
                                                          imageUrl: AppLink
                                                              .defaultFemaleImg),
                                                      Text(snapshot.data!
                                                          .likeList![index])
                                                    ],
                                                  ),
                                                ],
                                              )),
                                          Divider(
                                            height: 2,
                                          )
                                        ],
                                      );
                                    },
                                  );
                                },
                              );
                            }
                          },
                          child: Text(
                            snapshot.data!.likeList!.length.toString(),
                            style: AppStyle.sixOneFourGreyTs,
                          ),
                        ),
                      ]);
                    } else {
                      return Row(children: [
                        InkWell(
                          onTap: () {
                            _likeDislikeApis.addLike(
                                postId: widget.post.postId!,
                                postedBy: widget.post.postedBy!);
                          },
                          child: ImageIcon(
                            AssetImage(AppImages.likeIcon),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        // InkWell(
                        //   onTap: () {},
                        //   child: Text(
                        //   "0",
                        //     style: AppStyle.sixOneFourGreyTs,
                        //   ),
                        // ),
                      ]);
                    }
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                StreamBuilder(
                  stream: FirebaseFeedRepo()
                      .getPostCommentList(postId: widget.post.postId!),
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ImageIcon(
                              AssetImage(AppImages.commentIcon),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            snapshot.data!.postCommentList!.length.toString(),
                            style: AppStyle.sixOneFourGreyTs,
                          ),
                        ],
                      );
                    } else {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: ImageIcon(
                              AssetImage(AppImages.commentIcon),
                            ),
                          ),
                          SizedBox(
                            width: 7,
                          ),
                          Text(
                            "0",
                            style: AppStyle.sixOneFourGreyTs,
                          ),
                        ],
                      );
                    }
                  },
                ),
                SizedBox(
                  width: 15,
                ),
                InkWell(
                  onTap: () {
                    FirebaseFeedRepo().reportOnPost(
                        postId: widget.post.postId!,
                        reportedById: FirebaseAuth.instance.currentUser!.uid);
                  },
                  child: ImageIcon(
                    AssetImage(AppImages.reportIcon),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            //comment box

            CommentBox(
              post: widget.post,
            ),
            SizedBox(
              height: 20,
            ),
            //comment user slide
            StreamBuilder(
                stream: CommentController()
                    .getFeedCommentList(postId: widget.post.postId!),
                builder: ((context, snapshot) {
                  if (snapshot.hasData && snapshot.data != null) {
                    PostCommentListModel listModel = snapshot.data!;
                    if (listModel.postCommentList!.length > 1) {
                      void _showAllComments(BuildContext context) {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return ListView.builder(
                              itemCount: listModel.postCommentList?.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CommentUserCard(
                                        comment:
                                            listModel.postCommentList![index],
                                      ),
                                    ),
                                    Divider(
                                      height: 2,
                                    )
                                  ],
                                );
                              },
                            );
                          },
                        );
                      }

                      return TextButton(
                          onPressed: () {
                            _showAllComments(context);
                          },
                          child: Text("view all comments"));
                    }
                    // return SizedBox();
                    return CommentUserCard(
                      comment: listModel.postCommentList![
                          listModel.postCommentList!.length - 1],
                    );
                  } else {
                    return Container(
                      child: Text("No Comment Found!"),
                    );
                  }
                })),
          ],
        ),
      );
    });
  }
}
