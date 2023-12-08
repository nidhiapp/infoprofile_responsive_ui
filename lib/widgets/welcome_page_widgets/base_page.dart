// import 'package:flutter/material.dart';
// import 'package:info_profile_ui/main.dart';
// import 'package:info_profile_ui/utils/app_colors.dart';
// import 'package:info_profile_ui/utils/app_texts.dart';
// import 'package:info_profile_ui/utils/constants.dart';
// import 'package:info_profile_ui/utils/global.dart';
// import 'package:info_profile_ui/utils/ui_helper.dart/custom_textstyles.dart';
// import 'package:info_profile_ui/view_model/onboarding_provider.dart';
// import 'package:info_profile_ui/view_model/provider.dart';
// import 'package:provider/provider.dart';

// class BasePage extends StatelessWidget {
//   const BasePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 17),
//       width: (w > 960)
//           ? 497
//           : (w > 450)
//               ? 500
//               : w * 0.9,
//       height: 400,
//       decoration: BoxDecoration(
//         color: AppColors.logincardColor,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [
//           BoxShadow(
//             color: Color.fromRGBO(25, 55, 102, 0.325),
//             offset: Offset(0, 10),
//             blurRadius: 40,
//             spreadRadius: 2,
//           ),
//         ],
//       ),
//       child: Consumer2<AuthProvider, Providers>(
//         builder: (context, authProvider, provider, child) {
//           return InkWell(
//             onTap: () {
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context) {
//                   return AlertDialog(
//                     backgroundColor: AppColors.logincardColor,
//                     title: const Text(
//                       AppTexts.logout,
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.WelcomePage),
//                     ),
//                     content:
//                         Text(AppTexts.areYouSure, style: custompoppinNormalTs),
//                     actions: [
//                       TextButton(
//                         child: const Text("No", style: TextStyle(color: Colors.black)),
//                         onPressed: () {
//                           Navigator.pop(context); // Close the dialog
//                         },
//                       ),
//                       TextButton(
//                         child: const Text(
//                           "Yes",
//                           style: TextStyle(color: Colors.black),
//                         ),
//                         onPressed: () async {
//                            Navigator.pop(context);
//                            await authProvider.logout(provider.desktopLogin()).then((value) {
//                             // if (value == true) {
//                             //   provider.desktopLogin();
//                             // }
//                           });
//                         },
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             // onTap: () {

//             //   provider.desktopLogin();
//             // },
//             child: Center(
//                 child: FutureBuilder(
//                     future: authProvider.getEmail(),
//                     builder: (context, snap) {
//                       if (snap.hasData) {
//                         return Column(
//                           children: [
//                             Text(snap.data.toString()),
//                             const Text("Logout")
//                           ],
//                         );
//                       }
//                       return provider.desktopLogin();
//                     })),
//           );
//         },
//       ),
//     );
//   }
// }
