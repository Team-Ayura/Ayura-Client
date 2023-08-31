import 'package:flutter/material.dart';

import '../../../widgets/features/symptom_tracking/calendar.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          Icons.arrow_back_outlined,
          Icons.lightbulb_outline_rounded,
          "Calendar",
          leftCallback :()=>Navigator.of(context).pop()),
          // rightCallback :()=>PageNavigator(context: context).nextPage(const Page2())),
      body: CalendarWidget(),
    );
  }
}