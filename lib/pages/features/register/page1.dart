import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/provider/autProvider/authentication_provider.dart';
import 'package:ayura/widgets/features/register/custom_radio_input.dart';
import 'package:ayura/widgets/features/register/rulerpicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int weightval = 1;
  int heightval = 1;
  final TextEditingController weightEditingController = TextEditingController(text: '50');
  final TextEditingController heightEditingController = TextEditingController(text: '50');

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final selectedValues = Provider.of<AuthenticationProvider2>(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.01),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              "Let's get to know you",
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
          ),

          SizedBox(height: height * 0.02),
          const Text(
            "Just a few questions, to get information about \n you! ",
            textAlign: TextAlign.center,
            style: AppStyles.bodyTextStyle2,
          ),
          SizedBox(height: height * 0.04),
          const Text(
            'Who are you?',
            style: AppStyles.subheadingTextStyle2,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Consumer<T>()
              Consumer<AuthenticationProvider2>(
                  builder: (context, auth, child) {
                return CustomRadioButton(
                    text: 'Male',
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.07, vertical: 9),
                    icon: Icons.male_outlined,
                    index: 1,
                    value: selectedValues.gender == "M" ? 1 : 2,
                    onChanged: (index) {
                      auth.updateGender("M");
                      selectedValues.updateGender("M");
                      // setState(() {
                      //   genderval = index;
                      // });
                    });
              }),
              const SizedBox(width: 20),
              Consumer<AuthenticationProvider2>(
                  builder: (context, auth, child) {
                return CustomRadioButton(
                    text: 'Female',
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.07, vertical: 9),
                    icon: Icons.female_outlined,
                    index: 2,
                    value: selectedValues.gender == "F" ? 2 : 1,
                    onChanged: (index) {
                      auth.updateGender("F");
                      selectedValues.updateGender("F");
                    });
              }),
            ],
          ),
          SizedBox(height: height * 0.04),
          //weight picker
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Weight',
                style: AppStyles.subheadingTextStyle2,
              ),
              Row(
                children: [
                  CustomRadioButton(
                      text: 'kg',
                      index: 1,
                      value: weightval,
                      onChanged: (index) {
                        setState(() {
                          weightval = index;
                        });
                      }),
                  const SizedBox(width: 10),
                  CustomRadioButton(
                      text: 'lbs',
                      index: 2,
                      value: weightval,
                      onChanged: (index) {
                        setState(() {
                          weightval = index;
                        });
                      }),
                ],
              ),
            ],
          ),
          Consumer<AuthenticationProvider2>(builder: (context, auth, child) {
            return RulerPickerInput(
              controller: weightEditingController,
              update: auth.updateWeight,
              onChanged: (newValue) {
                print(newValue);
                selectedValues.updateWeight(int.tryParse(newValue) ?? 0);
                setState(() {
                  weightEditingController.text = newValue;
                });
              },
              value: selectedValues.weight,
            );
          }),

          SizedBox(height: height * 0.04),

          //Height picker
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Height',
                style: AppStyles.subheadingTextStyle2,
              ),
              Row(
                children: [
                  CustomRadioButton(
                      text: 'cm',
                      index: 1,
                      value: heightval,
                      onChanged: (index) {
                        setState(() {
                          heightval = index;
                        });
                      }),
                  const SizedBox(width: 10),
                  CustomRadioButton(
                    text: 'in/ft',
                    index: 2,
                    value: heightval,
                    onChanged: (index) {
                      setState(() {
                        heightval = index;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          Consumer<AuthenticationProvider2>(builder: (context, auth, child) {
            return RulerPickerInput(
              controller: heightEditingController,
              update: (value) {
                auth.updateHeight(value);
              },
              onChanged: (newValue) {
                print(newValue);
                selectedValues.updateWeight(int.tryParse(newValue) ?? 0);
                 setState(() {
                  heightEditingController.text = newValue;
                });
              },
              value: selectedValues.height ?? 0,
            );
          }),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
