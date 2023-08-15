import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/features/mood_tracking/page3.dart';
import 'package:ayura/widgets/features/mood_traking/mood_chips.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ayura/pages/features/mood_tracking/page2.dart';
import 'package:provider/provider.dart';

import '../../../provider/moodProviders/selectedmood.dart';
import '../../../utils/router.dart';
import '../../../widgets/global/bottom_navigation.dart';

// import 'package:ayura/widgets/features/mood_tracking/mood_chips.dart';

class SelectMood extends StatelessWidget {
  const SelectMood({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    final moodProvider = Provider.of<MoodProvider>(context);
    //past dates moods
     


    return Scaffold(
      //top app bar with icons
      // appBar: CustomAppBar(Icons.arrow_back_outlined,
      //     Icons.calendar_month_outlined, "Mood Tracker",
      //     leftCallback: () => Navigator.of(context).pop(),
      //     rightCallback: ()=>PageNavigator(context: context).nextPage(const ThirdPage())),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(onPressed:(){PageNavigator(context: context).nextPage(const ThirdPage());} , icon:Icon(Icons.calendar_month_outlined) ),
              ],),
            
            const SizedBox(
              height: 20,
            ),

            //top image
            Center(
              child: SvgPicture.asset(
                'assets/images/mood_tracking/mood_tracker_pg1.svg',
                width: 350,
                height: 350,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //middle question
            const Center(
              child: Text(
                "What was your mood today?",
                style: AppStyles.headingTextStyle,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //moods chips
            const Center(
              child: Padding(
                padding:EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Expanded(
                  child: Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      MoodButton(emojiName: 'Happy', mood: 'Happy'),
                      MoodButton(emojiName: 'Tired', mood: 'Tired'),
                      MoodButton(emojiName: 'Sad', mood: 'Sad'),
                      MoodButton(emojiName: 'Angry', mood: 'Angry'),
                      MoodButton(emojiName: 'Stressed', mood: 'Stressed'),
                      MoodButton(emojiName: 'Bored', mood: 'Bored'),
                      // MoodButton(emojiName: 'calm', mood: 'Calm'),
                      // MoodButton(emojiName: 'lonely', mood: 'Lonely'),
                      // MoodButton(emojiName: 'sick', mood: 'Sick'),
                      // MoodButton(emojiName: 'embarrassed', mood: 'Embarassed'),
                      // MoodButton(emojiName: 'scared', mood: 'Scared'),
                      // MoodButton(emojiName: 'excited', mood: 'Excited'),
                      // MoodButton(emojiName: 'sleepy', mood: 'Sleepy'),
                      // MoodButton(emojiName: 'surprised', mood: 'Surprised'),
                      // MoodButton(emojiName: 'hurt', mood: 'Hurt'),
                      // MoodButton(emojiName: 'nervous', mood: 'Nervous'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: customButton(
                  tap: () {
                    //if atleast one mood selected then move to next page otherwise display snackbar
                  if (moodProvider.selectedCount > 0) {
                    DateTime selectedDateTime = DateTime.now(); // Capture the current date and time
                    moodProvider.selectMood(moodProvider.selectedMood, selectedDateTime);
                    moodProvider.removeMoodFromHistory(selectedDateTime);
                    moodProvider.addMoodToHistory(moodProvider.selectedMood, selectedDateTime);
                    PageNavigator(context: context).nextPage(SecondPage());
                  } else {
                    // Show a snackbar or any other feedback that a mood should be selected
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please select a mood before proceeding.'),
                      ),
                    );
                  }
                },
                  icon: Icons.arrow_forward,
                  text: 'This is how I feel',
                  width: 200,
                  height: 60,
                  context: context),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: AppNavigation(),
    );
  }
}
