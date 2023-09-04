import 'package:ayura/constants/enums.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleAuthProvider extends ChangeNotifier{
  GoogleSignInAccount? user;
  bool isUserAuthorized = false;
  final _googleSignIn = GoogleSignIn(
      forceCodeForRefreshToken: true,
      // adding google fit required scopes
      scopes: ['https://www.googleapis.com/auth/fitness.activity.read',
        'https://www.googleapis.com/auth/fitness.body.read',
        'https://www.googleapis.com/auth/fitness.heart_rate.read',
        'https://www.googleapis.com/auth/fitness.location.read',
        'https://www.googleapis.com/auth/fitness.sleep.read']
  );

  void login() async {// Replace with your desired scopes
    try {
      _googleSignIn.disconnect();
      GoogleSignInAccount? newUser = await _googleSignIn.signIn();
      GoogleSignInAuthentication? googleSignInAuthentication;

      if (newUser != null) {
        googleSignInAuthentication = await newUser.authentication;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString(
            BasicUserData.googleAccessToken.label, googleSignInAuthentication.accessToken ?? "");
        print(prefs.getString(BasicUserData.googleAccessToken.label));
      }
    } catch (error) {
      print("Error signing in with Google: $error");
    }
    isUserAuthorized = !isUserAuthorized;
    notifyListeners();
  }


  void toggleGoogleAuthorization(bool togglebtn) async{
      if(togglebtn){
        _googleSignIn.disconnect();
        user = null;
      }else{
        // user = await _googleSignIn.signIn();
        login();
      }
      isUserAuthorized = !isUserAuthorized;
      notifyListeners();
  }

  // Future<String?> getAccessToken() async {
  //   // handle the full flow here
  //   // if the token is expired refresh it here
  //   // if the user is not authorized, authorize here
  //   // so that some how this method returns the accessToken
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   GoogleSignInAuthentication? googleSignInAuthentication;
  //   if(user != null) {
  //     googleSignInAuthentication = await user!
  //         .authentication;
  //     prefs.setString(BasicUserData.googleAccessToken.label, googleSignInAuthentication.accessToken ?? "");
  //   }else{
  //     login();
  //     return await getAccessToken();
  //   }
  //   return prefs.getString(BasicUserData.googleAccessToken.label);
  // }

}