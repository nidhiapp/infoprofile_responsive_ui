import 'package:flutter/material.dart';
import 'package:info_profile_ui/repository/firebase_api.dart';
import 'package:info_profile_ui/ui/base_page.dart';
import '../ui/home_page.dart';

class AuthProvider extends ChangeNotifier {
  int _authStateIndex = 0;
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  int get authStateIndex => _authStateIndex;

  void switchState() {
    _authStateIndex = (_authStateIndex + 1) % 4;
    notifyListeners();
  }

  final FirebaseApi _api = FirebaseApi();

  Future createAccount(BuildContext context)  async {
    String email =  emailCont.text.toString().trim();
    String pass =  passCont.text.toString().trim();
    // if(Utils.isValidEmail(email) || Utils.isValidPass(pass)) return;
    debugPrint("Email is $email password is $pass");
    await _api.registerUserWithEmailPassword(email, pass).then((value){
        debugPrint("Login Success");
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const BasePage()));
      }).onError((error, stackTrace){
        debugPrint("Login Failed!");
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Create Account Error $error")));
      });
   }



   getEmail() async {
     return await _api.getEmail();
   }

   logout (BuildContext context) async {
     debugPrint("Going to logout Provider");
    await _api.logOut().then((value){
        if(value == true){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CompleteSetUps(),));
        }
        else{
          debugPrint("Error -->$value");
        }
      }).onError((error, stackTrace){
        debugPrint("Error $error");
    });
   }


   static String? verificationCode;

   Future<bool?> sendOtp() async {
     String phoneN = phoneNumber.text.toString().trim();
     bool? res;
     await _api.sendOtp(phoneN).then((value){
        verificationCode = value;
        res = true;
     }).onError((error, stackTrace) {

     });
    return res;
   }

  Future<bool?> verifyOtp() async {
     bool? res;
     String otp = otpController.text.toString().trim();
     if(otp.length < 6) return res;
     await _api.matchOtp(verificationCode ?? "", otp).then((value){
        res = true;
     }).onError((error, stackTrace){
        debugPrint("Error while verify otp $error");
     });
     return res;
  }

  Future<bool?> forgetPassword() async {
     bool? res;
     String email = emailCont.text.toString().trim();
    await _api.forgetPassword(email).then((value){
      res = true;
      debugPrint("Success in sending otp to the mail for forget password");
    }).onError((error, stackTrace){
      debugPrint("Error while sending forget Password otp send");
    });
    return res;
  }

}
