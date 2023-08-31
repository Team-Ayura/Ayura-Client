import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/provider/autProvider/authentication_provider.dart';
import 'package:ayura/utils/convertDate.dart';
import 'package:ayura/widgets/global/textinput.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class PageThree extends StatefulWidget {
  const PageThree({Key? key}) : super(key: key);

  @override
  PageThreeState createState() => PageThreeState();
}

class PageThreeState extends State<PageThree> {
  late TextEditingController firstNameController = TextEditingController();
  late TextEditingController lastNameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController birthdayController = TextEditingController();
  final TextEditingController nationalityController = TextEditingController();
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

  @override
  void initState() {
    firstNameController.text =
        Provider.of<AuthenticationProvider2>(context, listen: false).firstName;
    lastNameController.text =
        Provider.of<AuthenticationProvider2>(context, listen: false).lastName;
    emailController.text =
        Provider.of<AuthenticationProvider2>(context, listen: false).email;

    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    birthdayController.dispose();
    nationalityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final inputs = Provider.of<AuthenticationProvider2>(context, listen: false);
    //selectedBloodGroup = inputs.bloodGroup;

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
              children: [
                SizedBox(height: height * 0.04),
                //Image.asset('assets/images/reg1.png', height: height * 0.4),
                Row(
                  children: [
                    Consumer<AuthenticationProvider2>(
                        builder: (context, auth, child) {
                      return CustomInput(
                          controller: firstNameController,
                          hintText: 'Namadee',
                          label: 'First Name',
                          width: width * 0.38,
                          height: height * 0.05,
                          onInput: (value) => {
                                auth.updateFirstName(firstNameController.text),
                                inputs.updateFirstName(firstNameController.text)
                              },
                          errorMsg: auth.firstnamevalidate.error);
                    }),
                    SizedBox(width: width * 0.05),
                    Consumer<AuthenticationProvider2>(
                        builder: (context, auth, child) {
                      return CustomInput(
                        controller: lastNameController,
                        hintText: 'Kahatapitiya',
                        label: 'Last Name',
                        width: width * 0.38,
                        height: height * 0.05,
                        onInput: (value) => {
                          auth.updateLastName(lastNameController.text),
                          inputs.updateLastName(lastNameController.text)
                        },
                        errorMsg: auth.lastnamevalidate.error,
                      );
                    }),
                  ],
                ),
                SizedBox(height: height * 0.02),
                Consumer<AuthenticationProvider2>(
                    builder: (context, auth, child) {
                  return CustomInput(
                    controller: emailController,
                    hintText: 'namadee@gmail.com',
                    label: 'Email',
                    width: width * 0.9,
                    height: height * 0.04,
                    onInput: (value) => {
                      auth.updateEmail(emailController.text),
                      inputs.updateEmail(emailController.text)
                    },
                    errorMsg: auth.emailvalidate.error,
                  );
                }),
                SizedBox(height: height * 0.02),
                Consumer<AuthenticationProvider2>(
                    builder: (context, auth, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'birthday',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Inter',
                          color: AppColors.primaryColor,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.9,
                        height: height * 0.1,
                        child: TextField(
                          controller: birthdayController,
                          decoration:
                              AppStyles().inputDecoration('2000-08-08', ''),
                          readOnly: true,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1980),
                                lastDate: DateTime.now());
                            if (pickedDate != null) {
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);

                              auth.updateBirthday(convertDate(formattedDate));
                              auth.getUserData();
                              setState(() {
                                birthdayController.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                            }
                          },
                        ),
                      )
                    ],
                  );
                }),

                //SizedBox(height: height * 0.02),
                Consumer<AuthenticationProvider2>(
                    builder: (context, auth, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Blood Group',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Inter',
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.065,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DropdownButtonFormField<String>(
                            value: selectedBloodGroup,
                            decoration: const InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 10, right: 10),
                              border: InputBorder.none,
                            ),
                            items: bloodGroups.map((bloodGroup) {
                              return DropdownMenuItem<String>(
                                value: bloodGroup,
                                child: Text(bloodGroup),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              auth.updateBloodGroup(newValue!);
                              setState(() {
                                selectedBloodGroup = newValue;
                              });
                            }),
                      ),
                    ],
                  );
                }),
                SizedBox(height: height * 0.03),
                Consumer<AuthenticationProvider2>(
                    builder: (context, auth, child) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Nationality',
                        style: TextStyle(
                          fontSize: 12,
                          fontFamily: 'Inter',
                          color: AppColors.primaryColor,
                        ),
                      ),
                      Container(
                        width: width,
                        height: height * 0.065,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
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
                              nationalityController.text =
                                  code?.name ?? 'Sri Lanka';
                              nationality = nationalityController.text;
                              auth.updateNationality(
                                  nationalityController.text);
                              // print(code.code);
                              // print(code.dialCode);
                              // print(code.flagUri);
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ],
            )),
          ]),
    );
  }
}
