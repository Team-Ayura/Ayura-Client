import 'package:ayura/auth/auth_screen.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/home.dart';
import 'package:ayura/provider/autProvider/authentication_provider.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/utils/snack_message.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../widgets/global/textinput.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.text = '';
    passwordController.text = '';
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
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Login",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
          ),
          SizedBox(height: height * 0.02),
          const Text(
            "Login to your account here ",
            textAlign: TextAlign.left,
            style: AppStyles.bodyTextStyle,
          ),
          SizedBox(height: height * 0.04),
          Image.asset('assets/images/login.png', height: height * 0.4),
          SizedBox(height: height * 0.01),
          CustomInput(
            controller: emailController,
            hintText: 'Email',
            label: '', errorMsg: '',
          ),
          const SizedBox(height: 5),
          CustomInput(
            controller: passwordController,
            hintText: 'Password',
            label: '', errorMsg: '',
          ),
          const SizedBox(height: 20),
          Consumer<AuthenticationProvider2>(builder: (context, auth, child) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (auth.resMessage != '') {
                showMessage(context, auth.resMessage);

                //clear the response message
                auth.clear();
              }
            });
            return customButton(
              text: 'Login',
              tap: () async {
                if (emailController.text.isEmpty ||
                    passwordController.text.isEmpty) {
                  showMessage(context, 'All fields are required');
                } else {
                  auth.loginUser(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    context: context,
                    callback: (bool loginSuccess) {
                      if (loginSuccess) {
                        showMessage(context, auth.resMessage);
                        PageNavigator(context: context).nextPage(const Home());
                      } else {
                        // Show an error message or handle the unsuccessful login case
                        showMessage(context, auth.resMessage);
                      }
                    },
                  );
                }
              },
              context: context,
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
                  PageNavigator(context: context).nextPage(const AuthScreen());
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
