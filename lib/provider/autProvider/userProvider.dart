import 'package:ayura/provider/models/userModel.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  UserModel _user = UserModel(
      activityLevel: '',
      birthday: '',
      email: '',
      firstName: '',
      gender: '',
      height: 0,
      lastName: '',
      weight: 0,
      bloodGroup: '',
      nationality: '',
      password: '');

  UserModel get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
