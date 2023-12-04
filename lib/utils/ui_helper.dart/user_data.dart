
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class UserData {
//   static late UserData userdata;
//   static SharedPreferences? _preferences;

//   UserData._internal() {
//     init();
//   }
//   factory UserData() {
//     userdata = UserData._internal();
//     return userdata;
//   }
//   static Future<void> init() async {
//     _preferences ??= await SharedPreferences.getInstance();
//   }

//   static Future<String?> getUserAccessToken() async {
//     final String? userDataString = _preferences?.getString('accessToken');
//     return userDataString;
//   }

//   static Future<String?> getUserName() async {
//     final String? userDataString = _preferences?.getString('userName');
//     return userDataString;
//   }

//   static Future<String?> getUserEmail() async {
//     final String? userDataString = _preferences?.getString('email');
//     return userDataString;
//   }

//   static Future<String?> getUserId() async {
//     final String? userDataString = _preferences?.getString('userId');
//     return userDataString;
//   }

//   static Future<String?> getUserCreatedAt() async {
//     final String? userDataString = _preferences?.getString('createdAT');
//     return userDataString;
//   }

//   static Future<String?> getUserbio() async {
//     final String? userDataString = _preferences?.getString('userBio');
//     return userDataString;
//   }

//   static Future<String?> getUserfullName() async {
//     final String? userDataString = _preferences?.getString('userFullName');
//     return userDataString;
//   }

//   static Future<String?> getUserProfilePic() async {
//     final String? userDataString = _preferences?.getString('userProfilePic');
//     return userDataString;
//   }

// //to update user name
//   static Future<String?> updateFullName(String userFullName) async {
//     await _preferences!.setString("userFullName", userFullName).then((value) {
//       return true;
//     }).onError((error, stackTrace) {
//       return false;
//     });
//     return null;
//   }

//   //to update bio
//   static Future<String?> updateUserBio(String userBio) async {
//     await _preferences!.setString("userBio", userBio).then((value) {
//       return true;
//     }).onError((error, stackTrace) {
//       return false;
//     });
//     return null;
//   }

//   //to upadte user Profilepic
//   static Future<String?> updateUserProfilePic(String userBio) async {
//     await _preferences!.setString("userProfilePic", userBio).then((value) {
//       return true;
//     }).onError((error, stackTrace) {
//       return false;
//     });
//     return null;
//   }

// //to update
//   static Future<bool?> updateProfileProperties({
//     String? userBio,
//     String? userProfilePic,
//     String? userFullName,
//   }) async {
//     bool res = true;
//     if (userFullName != null && userFullName.isNotEmpty) {
//       await updateFullName(userFullName).onError((error, stackTrace) {
//         res = false;
//         return null;
//       });
//     }
//     if (userBio != null && userBio.isNotEmpty) {
//       await updateFullName(userBio).onError((error, stackTrace) {
//         res = false;
//         return null;
//       });
//     }
//     if (userProfilePic != null && userProfilePic.isNotEmpty) {
//       await updateFullName(userProfilePic).onError((error, stackTrace) {
//         res = false;
//         return null;
//       });
//     }
//   }

//   // to save userdetails at login

//   static Future<bool?> saveUser(UserDataModel user) async {
//     await init();
//     bool? isAllSaved;
//     await _preferences!
//         .setString('accessToken', user.accessToken)
//         .then((value) {
//       isAllSaved = true;
//       debugPrint("----data saved:${value}");
//     }).onError((error, stackTrace) {
//       isAllSaved = false;
//       debugPrint("----------unable to save data-------");
//     });
//     await _preferences!.setString('userName', user.data.username).then((value) {
//       debugPrint('userName data saved--$value');
//       isAllSaved = isAllSaved! & true;
//     }).onError((error, stackTrace) {
//       isAllSaved = isAllSaved! & false;
//       debugPrint('error during saving username data $error');
//     });
//     await _preferences!.setString('userId', user.data.id).then((value) {
//       debugPrint('userId data saved--$value');
//       isAllSaved = isAllSaved! & true;
//     }).onError((error, stackTrace) {
//       isAllSaved = isAllSaved! & false;
//       debugPrint('could not save userId data --$error');
//     });
//     await _preferences!.setString('email', user.data.email).then((value) {
//       debugPrint('email data saved--$value');
//       isAllSaved = isAllSaved! & true;
//     }).onError((error, stackTrace) {
//       isAllSaved = isAllSaved! & false;
//       debugPrint('could not save email data --$error');
//     });
//     await _preferences!
//         .setString('createdAt', user.data.createdAt.toString())
//         .then((value) {
//       isAllSaved = isAllSaved! & true;
//       debugPrint('createdAt data saved--$value');
//     }).onError((error, stackTrace) {
//       isAllSaved = isAllSaved! & false;
//       debugPrint('could not save createdAt data --$error');
//     });

//     return isAllSaved;
//   }

//   //to remove user details

//   static Future<bool> removeUser() async {
//     bool remove = true;
//     await _preferences?.remove('accessToken').then((value) {
//       remove &= true;
//     }).onError((error, stackTrace) {
//       remove &= false;
//     });
//     await _preferences?.remove('userId').then((value) {
//       remove &= true;
//     }).onError((error, stackTrace) {
//       remove &= false;
//     });
//     await _preferences?.remove('userName').then((value) {
//       remove &= true;
//     }).onError((error, stackTrace) {
//       remove &= false;
//     });
//     await _preferences?.remove('email').then((value) {
//       remove &= true;
//     }).onError((error, stackTrace) {
//       remove &= false;
//     });
//     await _preferences?.remove('createdAt').then((value) {
//       remove &= true;
//     }).onError((error, stackTrace) {
//       remove &= false;
//     });
//     // await _preferences?.remove('')
//     return remove;
//   }
// }
