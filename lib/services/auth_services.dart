import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:info_profile_ui/repository/firebase_api.dart';

class AuthServices {
  Future isUserAlreadyLogin() async{
    bool? res;
    res =  await FirebaseApi().isLogin();
    return res;
  }
}


class GoogleAuthService {
  // Google SignIn
  Future<UserCredential> signInWithGoogle() async {
    // Sign begins
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Get Authentication details
    final GoogleSignInAuthentication gAuth = await googleUser!.authentication;

    // Create credentials for the user
    final cred = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken, idToken: gAuth.idToken);

    // Now let's sign in
    return await FirebaseAuth.instance.signInWithCredential(cred);
  }


}
