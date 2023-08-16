import 'package:ayura/pages/features/symptom_tracking/chest.dart';
import 'package:ayura/pages/features/symptom_tracking/page1.dart';
import 'package:ayura/pages/features/symptom_tracking/page2.dart';
import 'package:ayura/pages/features/symptom_tracking/stomach.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    PageNavigator(context: context).nextPage(const Page2());
                  },
                  icon: const Icon(Icons.calendar_month_outlined)),
            ],
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            child: Text(
              'Choose where you had an uncomfortable sensation today',
              style: AppStyles.headingTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20.0),
          Expanded(
            child: Stack(
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/symptom_tracking/human.png',
                    width: 210,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  left: 195,
                  top: 15,
                  child: GestureDetector(
                    onTap: () {
                      PageNavigator(context: context).nextPage(const Page1());
                      print('Tapped on Head');
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 150,
                  top: 95,
                  child: GestureDetector(
                    onTap: () {
                      PageNavigator(context: context).nextPage(const Page1());
                      print('Tapped on Shoulder');
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 130,
                  top: 190,
                  child: GestureDetector(
                    onTap: () {
                      PageNavigator(context: context).nextPage(const Page1());
                      print('Tapped on Arm');
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                  Positioned(
                    left: 195,
                    top: 120,
                    child: GestureDetector(
                      onTap: () {
                        PageNavigator(context: context).nextPage(const Chest());
                        print('Tapped on Chest');
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 195,
                    top: 190,
                    child: GestureDetector(
                      onTap: () {
                        PageNavigator(context: context).nextPage(const Stomach());
                        print('Tapped on Stomach');
                      },
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  left: 175,
                  top: 325,
                  child: GestureDetector(
                    onTap: () {
                      PageNavigator(context: context).nextPage(const Page1());
                      print('Tapped on Knee');
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 180,
                  top: 460,
                  child: GestureDetector(
                    onTap: () {
                      PageNavigator(context: context).nextPage(const Page1());
                      print('Tapped on Foot');
                    },
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
