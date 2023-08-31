import 'package:ayura/pages/features/symptom_tracking/page2.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import '../../../constants/styles.dart';
import '../../../widgets/global/tip_chip.dart';
import 'package:ayura/pages/features/symptom_tracking/nearbyhospitals.dart';

import '../vitals/vitals.dart';

class ChestTips extends StatelessWidget {
  const ChestTips({super.key});

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
              'We have noticed a continuous chest discomfort over the past few days',
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
                  title: 'Seek Medical Help',
                  description: 'Chest pain can be a sign of a serious condition. If you experience severe or persistent chest pain, seek medical attention immediately.',
                  image: 'assets/images/symptom_tracking/doctor.png',
                ),
                TipChip(
                  title: 'Practice Deep Breathing',
                  description: 'Deep breathing exercises can help relax muscles and reduce chest pain. Inhale deeply through your nose, hold, and exhale slowly.',
                  image: 'assets/images/symptom_tracking/breath.png',
                ),
                TipChip(
                  title: 'Stay Calm',
                  description: 'Anxiety and stress can worsen chest pain. Practice relaxation techniques like meditation or listening to soothing music.',
                  image: 'assets/images/symptom_tracking/stress.png',
                ),
                TipChip(
                  title: 'Avoid Heavy Meals',
                  description: 'Large, heavy meals can exacerbate chest pain. Opt for smaller, lighter meals to ease digestion and reduce discomfort.',
                  image: 'assets/images/symptom_tracking/food.png',
                ),
                TipChip(
                  title: 'Stay Upright',
                  description: 'Sit or stand upright to reduce pressure on the chest and improve breathing. Avoid slouching or lying flat.',
                  image: 'assets/images/symptom_tracking/walk.png',
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}