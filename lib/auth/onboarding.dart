import 'package:ayura/auth/signup.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
    navigator();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Onboarding Screen'),
      ),
    );
  }

  void navigator() {
    Future.delayed(const Duration(seconds: 3), () {
      PageNavigator(context: context).NextPageOnly(const Signup());
    });
  }
}
