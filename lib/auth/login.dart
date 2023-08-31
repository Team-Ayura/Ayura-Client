import 'package:ayura/auth/auth_screen.dart';
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
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ListView(
          children: [
            SizedBox(
              height: height * 0.4,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(110.0),
                      bottomRight: Radius.circular(110.0),
                    ),
                    child: Transform.scale(
                      scale: 1.5,
                      child: Image.asset(
                        'assets/images/backgroundImg.png',
                        height: height * 0.35,
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 90,
                      width: 96,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "Login",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor),
              ),
            ),
            SizedBox(height: height * 0.02),
            const Text(
              "Welcome to Ayura - Let's Get You Signed In!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textColor),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 35),
              child: Column(
                children: [
                  SizedBox(height: height * 0.01),
                  CustomInput(
                    controller: emailController,
                    hintText: 'Email',
                    label: '',
                    errorMsg: '',
                  ),
                  const SizedBox(height: 5),
                  CustomInput(
                    controller: passwordController,
                    hintText: 'Password',
                    label: '',
                    errorMsg: '',
                    obscure: true,
                  ),
                  const TextButton(
                    onPressed: null,
                    child: Text(
                      "Forgot your password ?",
                      style: TextStyle(
                        fontFamily: "Inter",
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Consumer<AuthenticationProvider2>(
                      builder: (context, auth, child) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (auth.resMessage != '') {
                        showMessage(context, auth.resMessage);

                        //clear the response message
                        auth.clear();
                      }
                    });
                    return customButton(
                      text: 'Sign in',
                      fontSize: 16,
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
                                PageNavigator(context: context)
                                    .nextPage(const Home());
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
                          PageNavigator(context: context)
                              .nextPage(const AuthScreen());
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
            ),
          ],
        ),
      ),
    );
  }
}
