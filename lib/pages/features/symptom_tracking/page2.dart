import 'package:flutter/material.dart';

import '../../../widgets/features/symptom_tracking/calendar.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar'),
      ),
      body: CalendarWidget(),
    );
  }
}