import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/utils/convertDate.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/primaryBtn.dart';
import 'package:ayura/widgets/global/textinput.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:intl/intl.dart';
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
  String selectedGender = "M";
  String? activityLevel;
  String selectedActivityLevel = '';
  String? selectedBloodGroup;
  String? nationality;
  List<String> bloodGroups = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-',
  ];
  List<String> activityLevels = [
    'somewhat_active',
    'sedentary',
    'active',
    'very_active'
  ];

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
    selectedBloodGroup = '';
    nationality = '';
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
              'Create an account here',
              style: AppStyles.subHeadingTextStyle,
            ),
            const SizedBox(height: 25),
            CustomInput(controller: emailController, hintText: 'Email', label: '',),
            const SizedBox(height: 20),
            CustomInput(
                controller: firstNameController, hintText: 'First Name', label: '',),
            const SizedBox(height: 20),
            CustomInput(controller: lastNameController, hintText: 'Last Name', label: '',),
            const SizedBox(height: 20),
            Container(
              width: width,
              height: height * 0.07,
              decoration: AppStyles.containerDecoration,
              child: DropdownButtonFormField<String>(
                  value: selectedBloodGroup,
                  decoration: const InputDecoration(
                    labelText: 'Blood Group',
                    border: OutlineInputBorder(),
                  ),
                  items: bloodGroups.map((bloodGroup) {
                    return DropdownMenuItem<String>(
                      value: bloodGroup,
                      child: Text(bloodGroup),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedBloodGroup = newValue;
                    });
                  }),
            ),
            const SizedBox(height: 20),
            Container(
              width: width,
              height: 50,
              decoration: AppStyles.containerDecoration,
              child: TextField(
                controller: birthdayController,
                decoration: InputDecoration(
                  fillColor: Colors.transparent,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide:
                        const BorderSide(color: Color(0xff23A6F0), width: 1.5),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.shade300, width: 1.5),
                  ),
                  hintText: 'Birthday',
                  hintStyle: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1980),
                      lastDate: DateTime.now());
                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16

                    setState(() {
                      birthdayController.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
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
                    nationality = nationalityController.text;
                    print(code!.name);
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
                  value: "M",
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
                  value: "F",
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
            Container(
              width: width,
              height: height * 0.07,
              decoration: AppStyles.containerDecoration,
              child: DropdownButtonFormField<String>(
                value: activityLevel,
                decoration: const InputDecoration(
                  labelText: 'Activity Level',
                  border: OutlineInputBorder(),
                ),
                items: activityLevels.map((String value) {
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
            ),
            const SizedBox(height: 20),
            CustomInput(controller: passwordController, hintText: 'Password', label: '',),
            const SizedBox(height: 20),
            CustomInput(
                controller: confirmPasswordController,
                hintText: 'Confirm Password', label: '',),
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
                text: 'Next',
                icon: Icons.arrow_forward,
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
                      birthday: convertDate(birthdayController.text.trim()),
                      weight: int.parse(weightController.text.trim()),
                      height: int.parse(heightController.text.trim()),
                      nationality: nationality!.trim(),
                      bloodGroup: selectedBloodGroup!,
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
