import 'package:flutter/material.dart';

import '../../../widgets/features/sleep_tracking/monthlycalendar.dart';

class SleepDetailsPage extends StatelessWidget {
  final DateTime date;
  final SleepQuality sleepQuality;

  SleepDetailsPage(this.date, this.sleepQuality);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sleep Details'),
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






