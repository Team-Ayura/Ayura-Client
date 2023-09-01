import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  void login() async{
      user = await _googleSignIn.signIn();
      notifyListeners();
  }

  void toggleGoogleAuthorization(bool togglebtn) async{
      if(togglebtn){
        _googleSignIn.disconnect();
        user = null;
      }else{
        user = await _googleSignIn.signIn();
      }
      isUserAuthorized = !isUserAuthorized;
      notifyListeners();
  }

  Future<String?> getAccessToken() async {
    // handle the full flow here
    // if the token is expired refresh it here
    // if the user is not authorized, authorize here
    // so that some how this method returns the accessToken
    GoogleSignInAuthentication? googleSignInAuthentication;
    if(user != null) {
      googleSignInAuthentication = await user!
          .authentication;
    }
    return googleSignInAuthentication?.accessToken;
  }

}