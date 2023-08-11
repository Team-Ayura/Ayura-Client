import 'package:ayura/pages/features/mood_tracking/page1.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';

import '../symptom_tracking/welcome.dart';

class Vitals extends StatelessWidget {
  const Vitals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Vitals"),
            TextButton(child: Text("mood"),onPressed: () {PageNavigator(context: context).nextPage(SelectMood());}),
            TextButton(child: Text("Symptoms"),onPressed: () {PageNavigator(context: context).nextPage(WelcomePage());}),
          ],
        ),
      ),
    );
  }
}