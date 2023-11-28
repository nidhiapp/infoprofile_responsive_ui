import 'package:flutter/material.dart';
import 'package:info_profile_ui/repository/firebase_api.dart';
import 'package:info_profile_ui/utils/app_colors.dart';
import '../services/auth_services.dart';
import '../ui/home_page.dart';

class AuthProvider extends ChangeNotifier {
  int _authStateIndex = 0;
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  FocusNode emailfocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  FocusNode buttonFocusNode = FocusNode();
  FocusNode phoneNumberFocusNode = FocusNode();

  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    phoneNumber.dispose();
    otpController.dispose();
    emailfocusNode.dispose();
    passwordFocusNode.dispose();
    passwordFocusNode.dispose();
    buttonFocusNode.dispose();
    phoneNumberFocusNode.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int get authStateIndex => _authStateIndex;

  void switchState() {
    _authStateIndex = (_authStateIndex + 1) % 4;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool val) async {
    _loading = val;

    notifyListeners();
  }

  final FirebaseApi _api = FirebaseApi();

  Future createAccount(BuildContext context) async {
    setLoading(true);

    String email = emailCont.text.toString().trim();
    String pass = passCont.text.toString().trim();
    // if(Utils.isValidEmail(email) || Utils.isValidPass(pass)) return;
    debugPrint("Email is $email password is $pass");
    await _api.registerUserWithEmailPassword(email, pass).then((value) {
      debugPrint("Login Success");
    }).onError((error, stackTrace) {
      debugPrint("Login Failed!");
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Create Account Error $error")));
    });
  }

  getEmail() async {
    return await _api.getEmail();
  }

  logout(BuildContext context) async {
    debugPrint("Going to logout Provider");
    setLoading(true);
    await _api.logOut().then((value) {
      if (value == true) {
        setLoading(false);
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => CompleteSetUps(),
        //     ));
      } else {
        debugPrint("Error -->$value");
      }
    }).onError((error, stackTrace) {
      debugPrint("Error $error");
    });
  }

  static String? verificationCode;

  Future<bool?> sendOtp() async {
    String phoneN = phoneNumber.text.toString().trim();
    bool? res;
    await _api.sendOtp(phoneN).then((value) {
      verificationCode = value;
      res = true;
    }).onError((error, stackTrace) {});
    return res;
  }

  Future<bool?> verifyOtp() async {
    bool? res;
    String otp = otpController.text.toString().trim();
    setLoading(true);
    if (otp.length < 6) return res;
    await _api.matchOtp(verificationCode ?? "", otp).then((value) {
      res = true;
      setLoading(false);
    }).onError((error, stackTrace) {
      debugPrint("Error while verify otp $error");
    });
    return res;
  }

  Future<bool?> forgetPassword() async {
    bool? res;
    String email = emailCont.text.toString().trim();
    setLoading(true);
    await _api.forgetPassword(email).then((value) {
      res = true;
      debugPrint("Success in sending otp to the mail for forget password");
      setLoading(false);
    }).onError((error, stackTrace) {
      debugPrint("Error while sending forget Password otp send");
    });
    return res;
  }

  loginUsingEmailAndPassword(BuildContext context) async {
    setLoading(true);
  
    String email = emailCont.text.toString().trim();
    String password = passCont.text.toString().trim();

    bool? res;
    await _api
        .loginUsingEmailAndPassword(
      email,
      password,
    )
        .then((value) {
      if (value == true) {
        debugPrint("Login Success Using Email and Password");
        setLoading(false);
      } else {
        debugPrint("Login failed! Using Email and Password");
      }
    }).onError((error, stackTrace) {});
  }

  GoogleAuthService service = GoogleAuthService();
  googleLogin() async {
    await service.signInWithGoogle().then((value) {
      debugPrint("Google Login Success");
    }).onError((error, stackTrace) {
      debugPrint("Google Login Failed!");
    });
  }
}
