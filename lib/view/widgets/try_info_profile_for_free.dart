import 'package:flutter/material.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import 'package:info_profile_ui/utils/app_texts.dart';
import 'package:info_profile_ui/utils/constants.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';

class TryInfoProfileForFree extends StatelessWidget {
  const TryInfoProfileForFree({super.key});

  @override
  Widget build(BuildContext context) {
    return (w > 960)
        ? desktopTryInfoProfileForFree()
        : (w > 450)
            ? tabletTryInfoProfileForFree()
            : mobileTryInfoProfileForFree();
  }

  static Widget desktopTryInfoProfileForFree() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50.0),
      child: Container(
          width: 900,height: 120,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.tryInfoProfBorderCol),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.03),
                  offset: Offset(0, 1),
                  blurRadius: 21,
                  spreadRadius: 0,
                ),
              ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
            child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppTexts.tryInfoProfile,
                      style: font600_30Ts,
                    ),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Wrap(
                      children: [
                        const Icon(
                          Icons.check,
                          size: 20,
                        ),
                        Text(
                          AppTexts.multipleProfiles,
                          style: font500_12Ts,
                        ),
                         SizedBox(width: 10,),
                        const Icon(
                          Icons.check,
                          size: 20,
                        ),
                        Text(
                          AppTexts.creative,
                          style: font500_12Ts,
                        ),
                         SizedBox(width: 10,),
                        const Icon(
                          Icons.check,
                          size: 20,
                        ),
                        Text(
                          AppTexts.buildConnections,
                          style: font500_12Ts,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  width: w * 0.1,
                ),
                Align(alignment: Alignment.centerRight,
                  child: Row(
                    children: [
                      Text(
                        AppTexts.signin,
                        style: font500_18Ts,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(padding: const EdgeInsets.all(3),
                        height: 30,width: 100,
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          AppTexts.signUp,
                          style: font600_18Ts,
                        )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  //for tablet
  static Widget tabletTryInfoProfileForFree() {
   return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Container(
            width: 550,height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.tryInfoProfBorderCol),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.03),
                    offset: Offset(0, 1),
                    blurRadius: 21,
                    spreadRadius: 0,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric( horizontal: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppTexts.tryInfoProfile,
                    style: font600_30Ts,
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                    Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.check,
                            size: 20,
                          ),Text(
                        AppTexts.multipleProfiles,
                        style: font500_12Ts,
                      ),
                        ],
                      ),
                      
                      Row(
                        children: [
                          const Icon(
                            Icons.check,
                            size: 20,
                          ), Text(
                        AppTexts.creative,
                        style: font500_12Ts,
                      ),
                        ],
                      ),
                     
                      Row(
                        children: [
                          const Icon(
                            Icons.check,
                            size: 20,
                          ),Text(
                        AppTexts.buildConnections,
                        style: font500_12Ts,
                      )
                        ],
                      ),
                      
                    ],
                  ),
                  // SizedBox(
                  //   width: w * 0.14,
                  // ),
                  Row(
                    children: [
                      Text(
                        AppTexts.signin,
                        style: font500_18Ts,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Center(
                            child: Text(
                          AppTexts.signUp,
                          style: font600_18Ts,
                        )),
                      ),
                    ],
                  ),
                   SizedBox(width: 5,),
                ],
              ),
            )));
  }

//for mobile
  static Widget mobileTryInfoProfileForFree() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Container(
            width: 400,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.tryInfoProfBorderCol),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.03),
                    offset: Offset(0, 1),
                    blurRadius: 21,
                    spreadRadius: 0,
                  ),
                ]),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppTexts.tryInfoProfile,
                        style: font600_30Ts,
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                                size: 20,
                              ), Text(
                            AppTexts.multipleProfiles,
                            style: font500_12Ts,
                          ),
                            ],
                          ),
                         
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                                size: 20,
                              ),
                               Text(
                            AppTexts.creative,
                            style: font500_12Ts,
                          ),
                            ],
                          ),
                         
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                                size: 20,
                              ),
                               Text(
                            AppTexts.buildConnections,
                            style: font500_12Ts,
                          )
                            ],
                          ),
                         
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    width: w * 0.14,
                  ),
                  Row(
                    children: [
                      Text(
                        AppTexts.signin,
                        style: font500_18Ts,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 30,
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: const Center(
                            child: Text(
                          AppTexts.signUp,
                          style: TextStyle(fontSize: 10,color:AppColors.logincardColor),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }
}
