import 'package:ayura/auth/auth_screen.dart';
import 'package:ayura/auth/login.dart';
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/onboardingImg.png',
                  height: 300,
                ),
                const SizedBox(height: 25),
                const Text("Let's Simplify, \n Health",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    )),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    ' Start your journey to a healthier lifestyle with personalized workouts, nutrition tips, and progress tracking.',
                    textAlign: TextAlign.center,
                    style: AppStyles.bodyTextStyle2,
                  ),
                ),
                const SizedBox(height: 20),
                customButton(
                    tap: () {
                      print('clicked');
                      PageNavigator(context: context)
                          .nextPage(const AuthScreen());
                    },
                    width: 200,
                    text: 'Get Started',
                    icon: Icons.arrow_forward,
                    context: context),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        PageNavigator(context: context).nextPage(const Login());
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
