import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:info_profile_ui/models/user_profile.dart';
import 'package:info_profile_ui/repository/firebase_api.dart';
import 'package:info_profile_ui/repository/profile_repo.dart';
import 'package:info_profile_ui/utils/custom_validation.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/app_link.dart';
import 'package:info_profile_ui/utils/ui_helper.dart/custom_toast.dart';
import '../services/auth_services.dart';

class AuthProviders extends ChangeNotifier {
  int _authStateIndex = 0;
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passCont = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final FocusNode emailfocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode buttonFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();

  @override
  void dispose() {
    emailCont.dispose();
    passCont.dispose();
    phoneNumber.dispose();
    otpController.dispose();
    emailfocusNode.dispose();
    passwordFocusNode.dispose();
    buttonFocusNode.dispose();
    phoneNumberFocusNode.dispose();
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
  final FirebaseProfileRepository _profileRepository =
      FirebaseProfileRepository();

  Future<bool?> createAccount(BuildContext context) async {
    setLoading(true);
    String email = emailCont.text.toString().trim();
    String pass = passCont.text.toString().trim();
    debugPrint("Email is $email password is $pass");
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    bool? res;
    await _api
        .registerUserWithEmailPassword(email, pass, context)
        .then((userCred) async {
      res = (userCred != null);
      if (userCred != null) {
        await _profileRepository
            .registerUser(UserProfileModel(
                uid: FirebaseAuth.instance.currentUser!.uid,
                image: AppLink.defaultFemaleImg,
                name: "Your Name",
                email: FirebaseAuth.instance.currentUser!.email,
                pass: "",
                joinDate: time,
                postList: [],
                followerList: [],
                followingList: [],
                username: "User Name",
                gender: "Not Specified",
                mobile: ""))
            .then((value) {
          debugPrint("Register Success");
          CustomToast(context: context, message: "Register Success");
        }).onError((error, stackTrace) {
          debugPrint("Register Failed Error $error");
        });
      }
    }).onError((error, stackTrace) {
      debugPrint("Register Failed!");

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Create Account Error: $error")));
    });
    setLoading(false);
    return res;
  }

  getEmail() async {
    return await _api.getEmail();
  }

  Future<bool?> logout() async {
    bool? res;
    debugPrint("Going to logout Provider");
   // setLoading(true);
    await FirebaseApi.logOut().then((value) {
      if (value == true) {
        res = value;
        //if (onTap != null) onTap();
      } else {
        debugPrint("Error -->$value");
      }
    }).onError((error, stackTrace) {
      debugPrint("Error $error");
    });
  //  setLoading(false);
    return res;
  }

  static String? verificationCode;

  Future<bool?> sendOtp() async {
    String phoneN = phoneNumber.text.toString().trim();
    bool? res;
    setLoading(true);
    await _api.sendOtp(phoneN).then((value) {
      verificationCode = value;
      res = true;
    }).onError((error, stackTrace) {});
    setLoading(false);
    return res;
  }

  Future<bool?> verifyOtp() async {
    bool? res;
    String otp = otpController.text.toString().trim();
    setLoading(true);
    debugPrint("Verify OTP");
    if (otp.length < 6) return res;
    await _api.matchOtp(verificationCode ?? "", otp).then((value) {
      res = value;
    }).onError((error, stackTrace) {
      debugPrint("Error while verify otp $error");
    });
    setLoading(false);
    return res;
  }

  Future<bool?> forgetPassword() async {
    bool? res;
    String email = emailCont.text.toString().trim();
    setLoading(true);
    await _api.forgetPassword(email).then((value) {
      res = true;
      debugPrint("Success in sending otp to the mail for forget password");
    }).onError((error, stackTrace) {
      debugPrint("Error while sending forget Password otp send");
    });
    setLoading(false);
    return res;
  }

  Future<bool?> loginUsingEmailAndPassword(BuildContext context, onTap) async {
    setLoading(true);
    String email = emailCont.text.toString().trim();
    String password = passCont.text.toString().trim();
    if (!Utils.isValidEmail(email) || !Utils.isValidPass(password)) {
      setLoading(false);
      return false;
    }
    bool? res;
    await _api
        .loginUsingEmailAndPassword(
      email,
      password,
    )
        .then((value) {
      res = value;
      if (value == true) {
        debugPrint("Login Success Using Email and Password");
          CustomToast(context: context, message: 'Login Success Using Email and Password');
        try {
          onTap();
          emailCont.text = "";
          passCont.text = "";
        } catch (e) {
          debugPrint("Error is $e");
        }
      } else {
     CustomToast(context: context, message: 'login failed');
      }
    }).onError((error, stackTrace) {
      CustomToast(context: context, message: '${error}');
    });
    setLoading(false);
    return res;
  }

  GoogleAuthService service = GoogleAuthService();
  Future<bool?> googleLogin() async {
    bool? res;
    await service.signInWithGoogle().then((value) {
      debugPrint("Google Login Success");
      emailCont.text = "";
      passCont.text = "";
      res = true;
    }).onError((error, stackTrace) {
      debugPrint("Google Login Failed!");
      res = false;
    });
    return res;
  }
}
