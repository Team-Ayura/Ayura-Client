import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/symptom_tracking/page2.dart';
import 'package:ayura/pages/features/symptom_tracking/welcome.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import '../../../constants/styles.dart';
import '../../../widgets/global/tip_chip.dart';
import 'package:ayura/pages/features/symptom_tracking/nearbyhospitals.dart';

import '../vitals/vitals.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Icons.arrow_back_outlined,
          Icons.calendar_month_outlined, "Daily Symptom Alert",
          leftCallback: () =>
              PageNavigator(context: context).nextPage(const Vitals()),
          rightCallback: () =>
              PageNavigator(context: context).nextPage(const Page2())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'We have noticed a continuous headache over the past few days',
              style: AppStyles.headingTextStyle,
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                'We suggest you to see a doctor, because there might be an underlying reason',
                style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: AppColors.textColor)),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: customButton(
                tap: () {
                  PageNavigator(context: context)
                      .nextPage(const NearbyHospitalsPage());
                },
                text: 'Nearby Government Hospitals',
                width: 300,
                height: null,
                context: context),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'General Health Tips',
                style: AppStyles.headingTextStyle,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              children: const [
                TipChip(
                  title: 'Stay Hydrated',
                  description: 'Drink plenty of water throughout the day to stay hydrated.',
                  image: 'assets/images/symptom_tracking/water.png',
                ),
                TipChip(
                  title: 'Manage Stress',
                  description: 'Practice relaxation techniques to reduce stress and ease headache symptoms.',
                  image: 'assets/images/symptom_tracking/stress.png',
                ),
                TipChip(
                  title: 'Take Breaks',
                  description: 'If you spend long hours in front of a screen, take regular breaks to rest your eyes and prevent tension headaches.',
                  image: 'assets/images/symptom_tracking/breath.png',
                ),
                TipChip(
                  title: 'Adequate Sleep',
                  description: 'Ensure you get enough sleep. Lack of sleep can contribute to headaches. Aim for 7-9 hours of quality sleep each night.',
                  image: 'assets/images/symptom_tracking/sleep2.png',
                ),
                TipChip(
                  title: 'Limit Caffeine',
                  description: 'Excessive caffeine intake can trigger headaches. Limit your caffeine consumption, especially if sensitive to it.',
                  image: 'assets/images/symptom_tracking/caffaine.png',
                ),
                TipChip(
                  title: 'Gentle Exercise',
                  description: 'Engage in light physical activity like walking or stretching to improve blood circulation and alleviate headaches.',
                  image: 'assets/images/symptom_tracking/exercise.png',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
