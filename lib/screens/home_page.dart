import 'package:flutter/material.dart';
import 'package:info_profile_ui/components/connections_list.dart';
import 'package:info_profile_ui/components/create_post.dart';
import 'package:info_profile_ui/components/custom_app_bar.dart';
import 'package:info_profile_ui/components/home_page_footer.dart';
import 'package:info_profile_ui/components/user_posts.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_images.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/global.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

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
              width: w*1,
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
                                    child: ListView.builder(
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return const ConnectionsListBox();
                                        }),
                                  ),
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
                                        ListView.builder(
                                            itemCount: 4,
                                            itemBuilder: (context, index) {
                                              return const ConnectionsListBox();
                                            }),
                                  ),
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
                    child: Column(
                      children: [
                        Expanded(
                            child: SingleChildScrollView(
                                child: Column(
                          children: [
                            const CreatePosts(),
                            ...List.generate(
                                10, (index) => const userPostConatiner()),
                          ],
                        )))
                      ],
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
                                    child: ListView.builder(
                                        itemCount: 4,
                                        itemBuilder: (context, index) {
                                          return const ConnectionsListBox();
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
