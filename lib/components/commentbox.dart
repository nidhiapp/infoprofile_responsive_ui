import 'package:flutter/material.dart';
import 'package:info_profile_ui/models/user_post_model.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/comment_controller.dart';

class CommentBox extends StatefulWidget {
  const CommentBox({super.key,required this.post});
final PostModel post;
  @override
  State<CommentBox> createState() => _CommentBoxState();
}

class _CommentBoxState extends State<CommentBox> {
  final CommentController _commentController = CommentController();
  final TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 9,
          child: TextFormField(
              controller: commentController,
              style: AppStyle.custompoppinNormalTs,
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 6.0, vertical: 6.0),
                  child: ClipOval(
                      child: CircularNetworkImage(
                    imageUrl: AppLink.defaultFemaleImg,
                    height: 20,
                    width: 20,
                  )),
                ),
                hintStyle: AppStyle.sixOnezeroTs,
                hintText: AppTexts.writeYourComment,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.borderCol, width: 1)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: AppColors.borderCol, width: 1)),
              ),
              maxLines:1,
              onFieldSubmitted: (value) async {
                if (value.isNotEmpty) {
                  await _commentController
                      .addComment(
                          comment: value,
                          postId: widget.post.postId!,
                          postedBy: widget.post.postedBy!)
                      .then((value) {
                    commentController.text = "";
                  });
                }
              }),
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
            child: CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primaryColor,
                child: InkWell(onTap: ()async {
                  
                  String text = commentController.text.toString().trim();
                  if(text.isNotEmpty) {
                    await _commentController.addComment(comment: text,
                        postId: widget.post.postId!,
                        postedBy: widget.post.postedBy!).then((value){
                      commentController.text = "";
                    }).onError((error, stackTrace){});
                  }
                  
                },
                  child: ImageIcon(
                    AssetImage(
                      AppImages.sendIcon,
                    ),
                    size: w * 0.015,
                    color: AppColors.logincardColor,
                  ),
                )))
      ],
    );
  }
}
