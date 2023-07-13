import 'dart:convert';
import 'dart:io';

import 'package:ayura/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider extends ChangeNotifier {
  //BaseURL
  final requestBaseUrl = appURLs.baseUrl;
  //setter
  bool _isLoading = false;
  String _resMessage = '';

  //getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  void registerUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String birthday,
    required String gender,
    required String nationality,
    required int height,
    required int weight,
    required String bloodGroup,
    required String activityLevel,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = '$requestBaseUrl/api/auth/signup';

    final body = {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName,
      "birthDay": birthday,
      "gender": gender,
      "nationality": nationality,
      "height": height,
      "weight": weight,
      "bloodGroup": bloodGroup,
      "activityLevel": activityLevel,
    };
    print(json.encode(body));
    // String encodedBody = json.encode(body);
    // print(encodedBody);
    try {
      http.Response req = await http.post(
        Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        _isLoading = false;
        _resMessage = "Registered Successfully!";
        notifyListeners();
      } else {
        final res = json.decode(req.body);
        _isLoading = false;
        _resMessage = res['message'];
        notifyListeners();
      }
    } on SocketException catch (e) {
      _isLoading = false;
      _resMessage = e.toString();
      notifyListeners();
    } catch (e) {
      print(e);

      _isLoading = false;
      _resMessage = e.toString();
      notifyListeners();
    }
  }

  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();

    String url = 'https://ayura.azurewebsites.net/api/auth/signin';

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
        _isLoading = false;
        _resMessage = "Login Successful!";
        notifyListeners();
      } else {
        final res = json.decode(req.body);
        print(res);
        _isLoading = false;
        _resMessage = res['message'];
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      print(_);
      _resMessage = 'No Internet Connection';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Something went wrong';
      notifyListeners();
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }
}
