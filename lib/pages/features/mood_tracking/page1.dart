import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectMood extends StatelessWidget {
  const SelectMood({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:Colors.transparent 
      ),
    );
    return Scaffold(
      
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //top app bar with icons
          CustomAppBar(Icons.arrow_back_outlined,Icons.calendar_month_outlined,"Mood Tracker"),
          const SizedBox(height: 20,),

          //top image
          Center(
            child: SvgPicture.asset(
              'assets/images/mood_tracker_pg1.svg',
              width: 350,
              height: 350,
            ),
          ),
          const SizedBox(height: 20,),
          //middle question
          const Center(child: Text(
            "What was your mood today?",
            style: AppStyles.mainQuestionsStyle,
            ),
          ),
          //moods chips

        ],
      ),
    );
  }
}