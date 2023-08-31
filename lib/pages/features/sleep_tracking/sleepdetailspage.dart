import 'package:flutter/material.dart';

import '../../../widgets/features/sleep_tracking/monthlycalendar.dart';

class SleepDetailsPage extends StatelessWidget {
  final DateTime date;
  final SleepQuality sleepQuality;

  const SleepDetailsPage(this.date, this.sleepQuality, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sleep Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Date: ${date.year}-${date.month}-${date.day}'),
            Text('Sleep Quality: $sleepQuality'),
          ],
        ),
      ),
    );
  }
}






