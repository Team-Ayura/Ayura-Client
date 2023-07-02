import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/primaryBtn.dart';
import 'package:ayura/widgets/global/textinput.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:provider/provider.dart';

import '../provider/autProvider/auth_provider.dart';
import '../utils/snack_message.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  String? gender;
  String selectedGender = '';
  String? activityLevel;
  String selectedActivityLevel = '';

  @override
  void dispose() {
    emailController.clear();
    firstNameController.clear();
    lastNameController.clear();
    birthdayController.clear();
    nationalityController.clear();
    heightController.clear();
    weightController.clear();
    bloodGroupController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    gender = '';
    selectedGender = '';
    activityLevel = '';
    selectedActivityLevel = '';
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
              'Create an account',
              style: AppStyles.subHeadingTextStyle,
            ),
            const SizedBox(height: 25),
            CustomInput(controller: emailController, hintText: 'Email'),
            const SizedBox(height: 20),
            CustomInput(
                controller: firstNameController, hintText: 'First Name'),
            const SizedBox(height: 20),
            CustomInput(controller: lastNameController, hintText: 'Last Name'),
            const SizedBox(height: 20),
            Container(
              width: width,
              height: 50,
              decoration: AppStyles.containerDecoration,
              child: DOBInputField(
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
                showLabel: true,
                dateFormatType: DateFormatType.YYYYMMDD,
                autovalidateMode: AutovalidateMode.always,
                fieldLabelText: "Birthday",
              ),
            ),
            const SizedBox(height: 25),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: AppStyles.containerDecoration,
              child: TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: AppStyles().inputDecoration('Height (cm)'),
                controller: heightController,
              ),
            ),
            const SizedBox(height: 25),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              decoration: AppStyles.containerDecoration,
              child: TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: AppStyles().inputDecoration('Weight (kg)'),
                controller: weightController,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: width,
              height: 50,
              decoration: AppStyles.containerDecoration,
              child: Align(
                alignment: Alignment.centerLeft,
                child: CountryListPick(
                  theme: CountryTheme(
                    isShowFlag: true,
                    isShowTitle: true,
                    isShowCode: false,
                    isDownIcon: true,
                    showEnglishName: true,
                  ),
                  initialSelection:
                      '+94', //inital selection, +672 for Antarctica
                  onChanged: (CountryCode? code) {
                    nationalityController.text = code?.name ?? '';
                    // print(code!.name);
                    // print(code.code);
                    // print(code.dialCode);
                    // print(code.flagUri);
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Gender',
              style: AppStyles.bodyTextStyle,
            ),
            Row(
              children: [
                const Text('Male'),
                Radio(
                  value: 'Male',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                      selectedGender = gender!;
                    });
                  },
                ),
                const Text('Female'),
                Radio(
                  value: 'Female',
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = value.toString();
                      selectedGender = gender!;
                    });
                  },
                )
              ],
            ),
            const SizedBox(height: 20),

            DropdownButton<String>(
              value: activityLevel,
              hint: const Text('Activity Level'),
              items: <String>[
                'somewhat_active',
                'sedentary',
                'active',
                'very_active'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  activityLevel = value;
                  selectedActivityLevel = activityLevel!;
                });
              },
            ),

            const SizedBox(height: 20),
            CustomInput(controller: passwordController, hintText: 'Password'),
            const SizedBox(height: 20),
            CustomInput(
                controller: confirmPasswordController,
                hintText: 'Confirm Password'),
            const SizedBox(height: 20),
            Consumer<AuthenticationProvider>(builder: (context, auth, child) {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                if (auth.resMessage != '') {
                  showMessage(context, auth.resMessage);

                  ///Clear the response message to avoid duplicate
                  auth.clear();
                }
              });
              return customButton(
                text: 'Register',
                tap: () {
                  if (emailController.text.isEmpty ||
                      passwordController.text.isEmpty ||
                      firstNameController.text.isEmpty ||
                      lastNameController.text.isEmpty) {
                    showMessage(context, 'All fields are required');
                    ;
                  } else {
                    auth.registerUser(
                      firstName: firstNameController.text.trim(),
                      lastName: lastNameController.text.trim(),
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                      birthday: birthdayController.text.trim(),
                      weight: int.parse(weightController.text.trim()),
                      height: int.parse(heightController.text.trim()),
                      nationality: nationalityController.text.trim(),
                      bloodGroup: bloodGroupController.text.trim(),
                      activityLevel: selectedActivityLevel,
                      gender: selectedGender,
                      context: context,
                    );
                  }
                },
                context: context,
                status: auth.isLoading,
              );
            }),
            // Consumer<AuthenticationProvider>(builder: (context, auth, child) {
            //   WidgetsBinding.instance!.addPostFrameCallback((_) {
            //     if (auth.resMessage != '') {
            //       showMessage(context, auth.resMessage);

            //       //clear the response message
            //       auth.clear();
            //     }
            //   });
            //   return PrimaryBtn(
            //       text: 'Sign Up',
            //       onPressed: (() {
            //         if (emailController.text.isEmpty ||
            //             passwordController.text.isEmpty) {
            //           showMessage(context, 'All fields are required');
            //         } else {
            //           auth.registerUser(
            //               email: emailController.text.trim(),
            //               password: passwordController.text.trim(),
            //               firstName: firstNameController.text.trim(),
            //               lastName: lastNameController.text.trim(),
            //               birthday: birthdayController.text.trim(),
            //               weight: int.parse(weightController.text.trim()),
            //               height: int.parse(heightController.text.trim()),
            //               nationality: nationalityController.text.trim(),
            //               bloodGroup: bloodGroupController.text.trim(),
            //               gender: selectedGender,
            //               activityLevel: selectedActivityLevel.trim(),
            //               context: context);
            //         }
            //       }));
            // }),
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
          ],
        ),
      )),
    );
  }
}
