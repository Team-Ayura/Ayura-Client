import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/home.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/register/custom_radio_input.dart';
import 'package:ayura/widgets/features/register/rulerpicker.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';

class PageOne extends StatefulWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int genderval = 0;
  int weightval = 1;
  int heightval = 1;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Column(
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
            CustomRadioButton(
                text: 'Male',
                padding:
                    EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 9),
                icon: Icons.male_outlined,
                index: 1,
                value: genderval,
                onChanged: (index) {
                  setState(() {
                    genderval = index;
                  });
                }),
            const SizedBox(width: 20),
            CustomRadioButton(
                text: 'Female',
                padding:
                    EdgeInsets.symmetric(horizontal: width * 0.1, vertical: 9),
                icon: Icons.female_outlined,
                index: 2,
                value: genderval,
                onChanged: (index) {
                  setState(() {
                    genderval = index;
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
        RulerPickerInput(),

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
                    }),
              ],
            ),
          ],
        ),
        RulerPickerInput(),
        const SizedBox(height: 20),
      ],
    );
  }
}
