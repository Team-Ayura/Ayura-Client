import 'package:ayura/pages/features/Diary/diary_list.dart';
import 'package:flutter/material.dart';

import '../../../utils/router.dart';
import '../../../widgets/features/sleep_tracking/sleeptabbarview.dart';
import '../../../widgets/global/bottom_navigation.dart';
import '../../../widgets/global/custom_app_bar.dart';


class SleepHistory extends StatelessWidget {
  const SleepHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Icons.arrow_back_outlined,
          Icons.lightbulb, "Sleep History",
          leftCallback: () => PageNavigator(context: context).nextPage(const DiaryList()),
          // rightCallback: ()=>PageNavigator(context: context).nextPage( )
          ),
      body:const SleepTabBarView(),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}