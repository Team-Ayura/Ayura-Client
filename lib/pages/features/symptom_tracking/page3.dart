import 'package:ayura/pages/features/symptom_tracking/page2.dart';
import 'package:ayura/pages/features/symptom_tracking/welcome.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';

import '../../../widgets/global/tip_chip.dart';
import 'package:ayura/pages/features/symptom_tracking/nearbyhospitals.dart';

import '../vitals/vitals.dart';

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Symptom Alert'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
            PageNavigator(context: context).nextPage(const Vitals());
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              PageNavigator(context: context).nextPage(const Page2());
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'We have noticed a continuous headache over the past few days',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'We suggest you to see a doctor, because there might be an underlying reason',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: ElevatedButton(
              onPressed: () {
                PageNavigator(context: context).nextPage(const NearbyHospitalsPage());

              },
              child: const Text('Nearby Government Hospitals'),
            ),
          ),
          const Center(
            child:Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'General Tips',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                TipChip(
                  title: 'Sleep 8 Hours',
                  description: 'Adequate sleep is crucial for your overall health and well-being. Aim for at least 8 hours of quality sleep each night.',
                  image: 'assets/images/symptom_tracking/sleep.png',
                ),
                TipChip(
                  title: 'Stay Hydrated',
                  description: 'Drink plenty of water throughout the day to stay hydrated and maintain proper bodily functions.',
                  image: 'assets/images/symptom_tracking/water.jpg',
                ),
                TipChip(
                  title: 'Healthy Diet',
                  description: 'Maintain a balanced diet rich in fruits, vegetables, whole grains, lean proteins, and healthy fats.',
                  image: 'assets/images/symptom_tracking/diet.jpg',
                ),
                TipChip(
                  title: 'Regular Exercise',
                  description: 'Engage in regular physical activity to improve your cardiovascular health, strengthen muscles, and boost mood.',
                  image: 'assets/images/symptom_tracking/sleep.png',
                ),
                TipChip(
                  title: 'Manage Stress',
                  description: 'Practice stress-reduction techniques such as meditation, deep breathing, and mindfulness to improve mental well-being.',
                  image: 'assets/images/symptom_tracking/sleep.png',
                ),
                TipChip(
                  title: 'Limit Sugary Intake',
                  description: 'Reduce consumption of sugary foods and beverages to maintain healthy blood sugar levels and oral health.',
                  image: 'assets/images/symptom_tracking/sleep.png',
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}