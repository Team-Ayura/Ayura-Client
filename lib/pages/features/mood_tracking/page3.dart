import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/widgets/features/mood_traking/custom_tab_bar_view.dart';
import 'package:flutter/material.dart';

import '../../../utils/router.dart';
import '../../../widgets/global/bottom_navigation.dart';
import '../Diary/diary_list.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Icons.arrow_back_outlined,Icons.lightbulb_outline_rounded,"Mood Analytics", leftCallback: () => PageNavigator(context: context).nextPage(const DiaryList())),
      body: const CustomTabBarView(),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}