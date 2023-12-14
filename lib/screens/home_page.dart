import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/components/connections_list.dart';
import 'package:info_profile_ui/components/create_post.dart';
import 'package:info_profile_ui/models/user_post_model.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_app_bar.dart';
import 'package:info_profile_ui/components/home_page_footer.dart';
import 'package:info_profile_ui/components/user_posts.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
import 'package:info_profile_ui/view_model/base_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    w = MediaQuery.of(context).size.width;
    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: -20,
            child: Image.asset(
              AppImages.homePageBg,
              width: w * 1,
              fit: BoxFit.fill,
            ),
          ),

          // Body App Bar
          CustomAppBar(),

          // Remaining Content
          Padding(
            padding: const EdgeInsets.only(top: 90, left: 15, right: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spa,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            constraints: const BoxConstraints(),
                            decoration: BoxDecoration(
                              color: AppColors.logincardColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: AppColors.borderCol),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppTexts.follower,
                                      style: AppStyle.connectionHeader),
                                  Expanded(
                                      child: StreamBuilder(
                                    stream: FirebaseProfileRepository()
                                        .getCurrentUserProfile(FirebaseAuth
                                            .instance.currentUser!.uid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.data != null) {
                                        if (snapshot
                                                .data!.followerList?.isEmpty ??
                                            true) {
                                          debugPrint(
                                              "Called **********************${snapshot.data!.followerList!.length}**************************");
                                          return Image.asset(
                                              AppImages.emptyImg);
                                        } else {
                                          return ListView.builder(
                                              itemCount: snapshot
                                                  .data!.followerList?.length,
                                              itemBuilder: (context, index) {
                                                return ConnectionsList(
                                                  imageLink:
                                                      AppLink.defaultFemaleImg,
                                                  uid: snapshot.data!
                                                              .followerList?[
                                                          index] ??
                                                      "",
                                                  name: snapshot.data!.email!,
                                                  removeOnTap: () {
                                                    FirebaseProfileRepository()
                                                        .removeFollower(
                                                            uid: snapshot
                                                                .data!
                                                                .followerList![
                                                                    index]
                                                                .toString());
                                                  },
                                                );
                                              });
                                        }
                                      } else {
                                        return Text("no follower found");
                                      }
                                    },
                                  )),
                                  Center(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            AppTexts.viewAll,
                                            style: AppStyle.connectionText,
                                          )))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Expanded(
                          child: Container(
                            constraints: const BoxConstraints(),
                            decoration: BoxDecoration(
                                color: AppColors.logincardColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: AppColors.borderCol)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppTexts.following,
                                      style: AppStyle.connectionHeader),
                                  Expanded(
                                      child:
                                          //   EmptyConnectionsListBox()
                                          StreamBuilder(
                                    stream: FirebaseProfileRepository()
                                        .getCurrentUserProfile(FirebaseAuth
                                            .instance.currentUser!.uid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.data != null) {
                                        if (snapshot
                                                .data!.followingList!.length ==
                                            0) {
                                          return Image.asset(
                                              AppImages.emptyImg);
                                        }
                                        return ListView.builder(
                                            itemCount: snapshot.data!
                                                    .followingList!.length ??
                                                0,
                                            itemBuilder: (context, index) {
                                              return Consumer<BaseProvider>(
                                                builder:
                                                    (context, value, child) {
                                                  return ConnectionsList(
                                                    imageLink: AppLink
                                                        .defaultFemaleImg,
                                                    uid: snapshot.data!
                                                        .followingList![index],
                                                    name: snapshot.data!.email!,
                                                    removeOnTap: () {
                                                      debugPrint("remove user");
                                                      FirebaseProfileRepository()
                                                          .removeFollowing(
                                                              uid: snapshot
                                                                      .data!
                                                                      .followingList![
                                                                  index]);
                                                    },
                                                  );
                                                },
                                              );
                                            });
                                      } else {
                                        debugPrint("show empty image ");
                                        return Image.asset(AppImages.emptyImg);
                                      }
                                    },
                                  )),
                                  Center(
                                      child: InkWell(
                                          onTap: () {},
                                          child: Text(
                                            AppTexts.viewAll,
                                            style: AppStyle.connectionText,
                                          )))
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 4,
                    child: Consumer<BaseProvider>(
                      builder: (context, baseProvider, child) {
                        return StreamBuilder<List<PostModel?>>(
                          stream: baseProvider.getUserFeed(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return SingleChildScrollView(
                                child: Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: CreatePosts(),
                                    ),
                                  ],
                                ),
                              
                              
                                    Center(
                                      child: CircularProgressIndicator(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    SizedBox(height: 560,)
                                    
                                  ],
                                ),
                              );
                            } else if (snapshot.hasError) {
                              debugPrint("Error State ${snapshot.error}");
                              return Container(
                                child: Text("errro is: ${snapshot.error}"),
                              );
                            } else if (snapshot.hasData &&
                                snapshot.data != null) {
                              List<PostModel?> posts = snapshot.data!;
                              return Column(
                                children: [
                                  Expanded(
                                      child: SingleChildScrollView(
                                          child: Column(
                                    children: [
                                      const CreatePosts(),
                                      ...List.generate(
                                          posts.length,
                                          (index) => userPostConatiner(
                                                post: posts[index]!,
                                              )),
                                    ],
                                  )))
                                ],
                              );
                            } else if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                snapshot.data == null ||
                                !snapshot.hasData) {
                              debugPrint("Waiting State");
                              return const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: CreatePosts(),
                                  ),
                                ],
                              );
                            } else {
                              return SizedBox();
                            }
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            constraints: const BoxConstraints(),
                            decoration: BoxDecoration(
                                color: AppColors.logincardColor,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 1, color: AppColors.borderCol)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(AppTexts.follower,
                                      style: AppStyle.connectionHeader),
                                  Expanded(
                                    child: StreamBuilder(
                                        stream: FirebaseProfileRepository()
                                            .getCurrentUserProfile(FirebaseAuth
                                                .instance.currentUser!.uid),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData &&
                                              snapshot.data != null) {
                                            List<String> list =
                                                snapshot.data!.followerList ??
                                                    [];
                                            debugPrint(
                                                "========================================================================================================");
                                            if (list.isEmpty) {
                                              return Image.asset(
                                                  AppImages.emptyImg);
                                            }
                                            return ListView.builder(
                                              itemCount: snapshot.data!
                                                      .followerList?.length ??
                                                  0,
                                              itemBuilder: (context, index) {
                                                debugPrint("Got Count $index");
                                                return Consumer<BaseProvider>(
                                                  builder:
                                                      (context, value, child) {
                                                    return ConnectionsList(
                                                      imageLink: AppLink
                                                          .defaultFemaleImg,
                                                      uid: snapshot.data!
                                                          .followerList![index],
                                                      name:
                                                          snapshot.data!.email!,
                                                      removeOnTap: () {
                                                        value.removeFollower(
                                                          uid: snapshot.data!
                                                                  .followerList![
                                                              index],
                                                        );
                                                      },
                                                    );
                                                  },
                                                );
                                              },
                                            );
                                          } else {
                                            return Text(
                                                "no follower found------");
                                          }
                                        }),
                                  ),
                                  Center(
                                      child: Text(
                                    AppTexts.viewAll,
                                    style: AppStyle.connectionText,
                                  ))
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Expanded(
                          child: HomePageFooter(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
