import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/global/textinput.dart';
import 'package:flutter/material.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  _PageThreeState createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
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
                "Get Started",
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor),
              ),
            ),
            SizedBox(height: height * 0.02),
            const Text(
              "Connect your devices to get bio data directly from those to our app.",
              textAlign: TextAlign.center,
              style: AppStyles.bodyTextStyle2,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0),
                children: [
                  Image.asset('assets/images/reg1.png', height: height * 0.4),
                  Row(
                    children: [
                      CustomInput(
                        controller: firstNameController,
                        hintText: 'Namadee',
                        label: 'First Name',
                        width: width * 0.4,
                        height: height * 0.05,
                      ),
                      SizedBox(width: width * 0.05),
                      CustomInput(
                        controller: lastNameController,
                        hintText: 'Kahatapitiya',
                        label: 'Last Name',
                        width: width * 0.4,
                        height: height * 0.05,
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.01),
                  CustomInput(
                    controller: emailController,
                    hintText: 'namadee@gmail.com',
                    label: 'Email',
                    width: width * 0.9,
                    height: height * 0.04,
                  ),
                  SizedBox(height: height * 0.01),
                  CustomInput(
                    controller: birthdayController,
                    hintText: '2000-08-08',
                    label: 'Birthday',
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
