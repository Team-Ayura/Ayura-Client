import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ayura/provider/models/userModel.dart';
import 'package:ayura/constants/constants.dart';

class AuthenticationProvider2 extends ChangeNotifier {
  // BaseURL
  final requestBaseUrl = appURLs.baseUrl;

  final UserModel _userModel = UserModel(
    gender: '',
    weight: 0,
    height: 0,
    activityLevel: '',
    firstName: '',
    lastName: '',
    email: '',
    birthday: '',
    nationality: '',
    bloodGroup: '',
    password: '',
  );

  // Setter
  String _resMessage = '';

  // Getter
  String get resMessage => _resMessage;
  String get gender => _userModel.gender;
  int get weight => _userModel.weight;
  int get height => _userModel.height;
  String get activityLevel => _userModel.activityLevel;
  String get firstName => _userModel.firstName;
  String get lastName => _userModel.lastName;
  String get email => _userModel.email;
  String get birthday => _userModel.birthday;
  String get bloodGroup => _userModel.bloodGroup;

  void updateGender(String gender) {
    _userModel.gender = gender;
    notifyListeners();
  }

  void updateWeight(int weight) {
    _userModel.weight = weight;
    notifyListeners();
  }

  void updateHeight(int height) {
    _userModel.height = height;
    notifyListeners();
  }

  void updateActivityLevel(String activityLevel) {
    _userModel.activityLevel = activityLevel;
    notifyListeners();
  }

  void updateFirstName(String firstName) {
    _userModel.firstName = firstName;
    notifyListeners();
  }

  void updateLastName(String lastName) {
    _userModel.lastName = lastName;
    notifyListeners();
  }

  void updateEmail(String email) {
    _userModel.email = email;
    notifyListeners();
  }

  void updateBirthday(String birthday) {
    _userModel.birthday = birthday;
    notifyListeners();
  }

  void updateNationality(String nationality) {
    _userModel.nationality = nationality;
  }

  void updateBloodGroup(String bloodGroup) {
    _userModel.bloodGroup = bloodGroup;
  }

  void updatePassword(String password) {
    _userModel.password = password;
  }

  void getUserData() {
    print(_userModel.toJson());
  }

  void updateUserInfo(
    String gender,
    int weight,
    int height,
    String activityLevel,
    String firstName,
    String lastName,
    String email,
    String birthday,
    String nationality,
    String bloodGroup,
    String password,
  ) {
    _userModel.gender = gender;
    _userModel.weight = weight;
    _userModel.height = height;
    _userModel.activityLevel = activityLevel;
    _userModel.firstName = firstName;
    _userModel.lastName = lastName;
    _userModel.email = email;
    _userModel.birthday = birthday;
    _userModel.nationality = nationality;
    _userModel.bloodGroup = bloodGroup;
    _userModel.password = password;
    notifyListeners();
  }

  Future<void> register() async {
    String url = '$requestBaseUrl/api/auth/signup';

    final body = _userModel.toJson();
    print(json.encode(body));

    try {
      print('try');
      http.Response req = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      print(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        print(res);

        _resMessage = "Registered Successfully!";
        notifyListeners();
      } else {
        final res = json.decode(req.body);

        _resMessage = res['message'];
        notifyListeners();
      }
    } on SocketException catch (e) {
      _resMessage = e.toString();
      notifyListeners();
    } catch (e) {
      print(e);

      _resMessage = e.toString();
      notifyListeners();
    }
  }

  Future<void> loginUser({
    required String email,
    required String password,
    BuildContext? context,
    required Function(bool) callback,
  }) async {
    String url = '$requestBaseUrl/api/auth/signin';

    final body = {
      "email": email,
      "password": password,
    };
    print(json.encode(body));

    try {
      http.Response req = await http.post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
          },
          body: json.encode(body));
      // print(req.statusCode);
      // print(req.body);

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        print(req.body);

        _resMessage = "Login Successful!";

        notifyListeners();
        callback(true);
      } else {
        final res = json.decode(req.body);
        print(res);

        _resMessage = res['reason'];

        notifyListeners();
        callback(false);
      }
    } on SocketException catch (_) {
      print(_);
      _resMessage = 'No Internet Connection';
      notifyListeners();
    } catch (e) {
      _resMessage = 'Something went wrong';
      notifyListeners();
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}
