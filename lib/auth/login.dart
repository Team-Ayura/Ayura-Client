import 'package:ayura/auth/signup.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/home.dart';
import 'package:ayura/provider/autProvider/auth_provider.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/utils/snack_message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../widgets/global/PrimaryBtn.dart';
import '../widgets/global/textinput.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SafeArea(
            child: Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: ListView(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Image.asset(
              'assets/images/logo.png',
              width: 50,
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 10),
              child: Text(
                'AYURA',
                style: AppStyles.headingTextStyle,
              ),
            ),
          ]),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Login to your account here',
            style: AppStyles.subHeadingTextStyle,
          ),
          const SizedBox(height: 25),
          CustomInput(controller: emailController, hintText: 'Email'),
          const SizedBox(height: 20),
          CustomInput(controller: passwordController, hintText: 'Password'),
          const SizedBox(height: 20),
          Consumer<AuthenticationProvider>(builder: (context, auth, child) {
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              if (auth.resMessage != '') {
                showMessage(context, auth.resMessage);

                //clear the response message
                auth.clear();
              }
            });
            return customButton(
              text: 'Login',
              tap: () {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  showMessage(context, 'All fields are required');
                } else {
                  auth.loginUser(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    context: context,
                  );
                  PageNavigator(context: context).nextPage(const Home());
                }
              },
              context: context,
              status: auth.isLoading,
            );
          }),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New to Ayura? ',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              InkWell(
                onTap: () {
                  PageNavigator(context: context).nextPage(const Signup());
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    )));
  }
}
