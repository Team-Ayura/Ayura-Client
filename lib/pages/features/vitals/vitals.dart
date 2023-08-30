import 'package:ayura/pages/features/mood_tracking/page1.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
import 'package:flutter/material.dart';

import '../../../widgets/global/custom_appbar.dart';
import '../../../widgets/global/vital_tab_bar.dart';
import '../mood_tracking/page3.dart';
import '../symptom_tracking/welcome.dart';

class Vitals extends StatelessWidget {
  const Vitals({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //  appBar: CustomAppBar(Icons.arrow_back_outlined,
      //     // Icons.calendar_month_outlined,
      //     "Vitals",
      //     leftCallback: () => Navigator.of(context).pop(),
      //     rightCallback: ()=>PageNavigator(context: context).nextPage(const ThirdPage())),
      appBar: CustomAppBar(appbarTitle: "Vitals", isBackBtn: true,),
      body:  VitalsTabBarView(),
      // body: Center(
      //   child: Column(
      //     children: [
      //       Text("Vitals"),
      //       TextButton(child: Text("mood"),onPressed: () {PageNavigator(context: context).nextPage(SelectMood());}),
      //       TextButton(child: Text("Symptoms"),onPressed: () {PageNavigator(context: context).nextPage(WelcomePage());}),
      //     ],
      //   ),
      // ),
      bottomNavigationBar: AppNavigation(),
    );
  }
}