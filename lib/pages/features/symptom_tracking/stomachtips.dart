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

class StomachTips extends StatelessWidget {
  const StomachTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Icons.arrow_back_outlined,
          Icons.calendar_month_outlined,
          "Daily Symptom Alert",
          leftCallback :()=>PageNavigator(context: context).nextPage(const Vitals()),
          rightCallback :()=>PageNavigator(context: context).nextPage(const Page2())),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'We have noticed a continuous stomach discomfort over the past few days',
              style: AppStyles.headingTextStyle,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'We suggest you to see a doctor, because there might be an underlying reason',
              style: AppStyles.subHeadingTextStyle,
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: customButton(
                tap: () {
                  PageNavigator(context: context).nextPage(const NearbyHospitalsPage());

                },
                text: 'Nearby Government Hospitals',
                width: 300,
                height: 60,
                context: context
            ),
          ),
          const Center(
            child:Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'General Health Tips',
                style: AppStyles.headingTextStyle,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                TipChip(
                  title: 'Chew Slowly',
                  description: 'Eating too quickly can lead to indigestion. Chew your food slowly and thoroughly to aid digestion.',
                  image: 'assets/images/symptom_tracking/chew.png',
                ),
                TipChip(
                  title: 'Avoid Trigger Foods',
                  description: 'Certain foods can trigger indigestion. Common triggers include spicy, fatty, and acidic foods. Avoid these to reduce discomfort.',
                  image: 'assets/images/symptom_tracking/food.png',
                ),
                TipChip(
                  title: 'Stay Hydrated',
                  description: 'Drinking water can help ease digestion and prevent indigestion. Stay hydrated throughout the day.',
                  image: 'assets/images/symptom_tracking/water.png',
                ),
                TipChip(
                  title: 'Eat Small Meals',
                  description: 'Large meals can overwhelm the digestive system. Opt for smaller, more frequent meals to reduce the risk of indigestion.',
                  image: 'assets/images/symptom_tracking/food.png',
                ),
                TipChip(
                  title: 'Avoid Late Night Eating',
                  description: 'Eating close to bedtime can contribute to indigestion. Finish your meals a few hours before sleep.',
                  image: 'assets/images/symptom_tracking/sleep2.png',
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}