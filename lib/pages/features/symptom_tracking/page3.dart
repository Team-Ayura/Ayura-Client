import 'package:ayura/pages/features/symptom_tracking/page2.dart';
import 'package:ayura/pages/features/symptom_tracking/welcome.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';

import '../../../widgets/global/tip_chip.dart';
import 'package:ayura/pages/features/symptom_tracking/nearbyhospitals.dart';

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
            PageNavigator(context: context).nextPage(const WelcomePage());
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
                PageNavigator(context: context).nextPage(NearbyHospitalsPage());

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
          const Column(
            children: [
              TipChip(
                title: 'Sleep 8 Hours',
                description: 'At least 8 hours of sleep is essential to keep you healthy both physically and mentally',
                image: 'assets/images/symptom_tracking/sleep.png', // Replace with the actual image asset path
              ),
              TipChip(
                title: 'Sleep 8 Hours',
                description: 'At least 8 hours of sleep is essential to keep you healthy both physically and mentally',
                image: 'assets/images/symptom_tracking/sleep.png', // Replace with the actual image asset path
              ),
              TipChip(
                title: 'Sleep 8 Hours',
                description: 'At least 8 hours of sleep is essential to keep you healthy both physically and mentally',
                image: 'assets/images/symptom_tracking/sleep.png', // Replace with the actual image asset path
              ),
              TipChip(
                title: 'Sleep 8 Hours',
                description: 'At least 8 hours of sleep is essential to keep you healthy both physically and mentally',
                image: 'assets/images/symptom_tracking/sleep.png', // Replace with the actual image asset path
              ),

              // Add more TipChips as needed
            ],
          ),
        ],
      ),
    );
  }
}