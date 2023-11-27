import 'package:info_profile_ui/repository/firebase_api.dart';

class AuthServices {
  Future isUserAlreadyLogin() async{
    bool? res;
    res =  await FirebaseApi().isLogin();
    return res;
  }
}