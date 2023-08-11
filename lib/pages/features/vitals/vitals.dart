import 'package:ayura/pages/features/mood_tracking/page1.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';

class Vitals extends StatelessWidget {
  const Vitals({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: TextButton(child: const Text("mood"),onPressed: () {PageNavigator(context: context).nextPage(const SelectMood());}),
    );
  }
}