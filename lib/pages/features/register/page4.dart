import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/global/textinput.dart';
import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  const PageFour({Key? key}) : super(key: key);

  @override
  _PageFourState createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                "Create a strong password",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
            ),
            SizedBox(height: height * 0.02),
            const Text(
              "We are saving critical health data, so make sure to keep your account safe.",
              textAlign: TextAlign.center,
              style: AppStyles.bodyTextStyle2,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Image.asset('assets/images/Password.png',
                      height: height * 0.4),
                  SizedBox(height: height * 0.05),
                  CustomInput(
                    controller: passwordController,
                    hintText: '********',
                    label: 'Password',
                    obscure: true,
                    width: width * 0.9,
                    height: height * 0.04,
                  ),
                  SizedBox(height: height * 0.01),
                  CustomInput(
                    controller: confirmPasswordController,
                    hintText: '********',
                    label: 'Confirm Password',
                    obscure: true,
                    width: width * 0.9,
                    height: height * 0.04,
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
