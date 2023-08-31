import 'package:flutter/material.dart';


//To use this mention PageNavigator(context: context).nextPage(const Signup())

class PageNavigator {
  PageNavigator({required this.context});
  BuildContext? context;

  //Navigate to next page
  Future nextPage(Widget? page) {
    return Navigator.push(
      context!,
      MaterialPageRoute(builder: (context) => page!),
    );
  }

  //Navigate without back button like from onboarding page to login page
  Future nextPageOnly(Widget? page) {
    return Navigator.pushAndRemoveUntil(
      context!,
      MaterialPageRoute(builder: (context) => page!), (route) => false,
    );
  }
}
