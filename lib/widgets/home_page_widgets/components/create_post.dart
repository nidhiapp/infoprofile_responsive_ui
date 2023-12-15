import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/circular_network_img.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/base_provider.dart';
import 'package:info_profile_ui/view_model/onboarding_provider.dart';
import 'package:info_profile_ui/view_model/provider.dart';
import 'package:provider/provider.dart';

class CreatePosts extends StatelessWidget {
  const CreatePosts({super.key});

  @override
  Widget build(BuildContext context) {
    bool isEmpty = true;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
      decoration: BoxDecoration(
          color: AppColors.logincardColor,
          border: Border.all(width: 1, color: AppColors.borderCol),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Color.fromRGBO(0, 0, 0, 0.02),
              blurRadius: 21,
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppTexts.updateYourActivity,
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: AppColors.blackNormalTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(2),
                    height: 25,
                    width: 54,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.borderCol),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        AppTexts.post,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: AppColors.blackNormalTextColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    AppTexts.blog,
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.bluishGrey,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Consumer2<Providers, BaseProvider>(
            builder: (context, providers, baseProvider, child) {
              return Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.borderCol, width: 1),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        StreamBuilder(
                          stream: FirebaseProfileRepository()
                              .getCurrentUserProfile(
                                  FirebaseAuth.instance.currentUser!.uid),
                          builder: (context, snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: ClipOval(
                                    child: CircularNetworkImage(
                                  imageUrl: snapshot.data!.image!,
                                  height: 30,
                                  width: 30,
                                )),
                              );
                            }else{
                              return Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: ClipOval(
                                    child: CircularNetworkImage(
                                  imageUrl: AppLink.defaultFemaleImg,
                                  height: 30,
                                  width: 30,
                                )),
                              );
                            }
                          },
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: baseProvider.postDescriptionController,
                            style: AppStyle.custompoppinNormalTs,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(10),
                              hintStyle: AppStyle.sixOnezeroTs,
                              hintText: AppTexts.startWriting,
                              border: InputBorder.none,
                            ),
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    baseProvider.isPicked
                        ? Stack(
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  width: w * 0.3,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: kIsWeb
                                          ? Image.memory(
                                              baseProvider.webImage!,
                                              fit: BoxFit.cover,
                                            )
                                          : Image.file(
                                              baseProvider.pickedImage))),
                              Positioned(
                                right: 3,
                                top: 3,
                                child: InkWell(
                                  onTap: () {
                                    baseProvider.resetImage();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.logincardColor,
                                        border: Border.all(
                                            width: 2,
                                            color: AppColors.borderCol)),
                                    child: const Icon(
                                      Icons.close,
                                      size: 18,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                  ],
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Consumer<BaseProvider>(
                builder: (context, value, child) {
                  return Row(
                    children: [
                      InkWell(
                        highlightColor: AppColors.primaryColor,
                        splashColor: AppColors.primaryColor,
                        onTap: value.pickImageFromDevice,
                        child: const Icon(Icons.image_sharp,
                            color: Color.fromRGBO(114, 178, 249, 1)),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.video_call_outlined,
                        color: Color.fromRGBO(114, 178, 249, 1),
                        size: 30,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.link,
                        color: Color.fromRGBO(114, 178, 249, 1),
                        size: 30,
                      )
                    ],
                  );
                },
              ),
              Consumer2<BaseProvider, AuthProviders>(
                builder: (context, baseProvider, provider, child) {
                  return InkWell(
                    onTap: baseProvider.createPost,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 20),
                      decoration: BoxDecoration(
                          color: baseProvider.postDescriptionController.text
                                  .toString()
                                  .isEmpty
                              ? AppColors.primaryColor
                              : AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                          child: baseProvider.loading
                              ? const Center(child: CircularProgressIndicator(color: AppColors.logincardColor,))
                              : Text(
                                  AppTexts.post,
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )),
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
