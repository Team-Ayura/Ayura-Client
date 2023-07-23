import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/features/mood_traking/mood_chips.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ayura/pages/features/mood_tracking/page2.dart';
// import 'package:ayura/widgets/features/mood_tracking/mood_chips.dart';


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
      //top app bar with icons
      appBar: CustomAppBar(Icons.arrow_back_outlined,Icons.calendar_month_outlined,"Mood Tracker",leftCallback :()=>Navigator.of(context).pop()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
      
            //top image
            Center(
              child: SvgPicture.asset(
                'assets/images/mood_tracking/mood_tracker_pg1.svg',
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
            const SizedBox(height: 20,),
            //moods chips
            const Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Expanded(
                  child:Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: [
                      
                       MoodButton(emojiName: 'happy', mood: 'Happy'),
                        MoodButton(emojiName: 'tired', mood: 'Tired'),
                        MoodButton(emojiName: 'sleepy', mood: 'Sleepy'),
                        MoodButton(emojiName: 'furious', mood: 'Angry'),
                        MoodButton(emojiName: 'bored', mood: 'Bored'),
                        MoodButton(emojiName: 'excited', mood: 'Excited'),
                        MoodButton(emojiName: 'sad', mood: 'Sad'),
                        MoodButton(emojiName: 'embarrassed', mood: 'Embarassed'),
                        MoodButton(emojiName: 'sick', mood: 'Sick'),
                        MoodButton(emojiName: 'lonely', mood: 'Lonely'),
                        MoodButton(emojiName: 'surprised', mood: 'Surprised'),
                        MoodButton(emojiName: 'calm', mood: 'Calm'),
                        MoodButton(emojiName: 'scared', mood: 'Scared'),
                        MoodButton(emojiName: 'stressed', mood: 'Stressed'),
                        MoodButton(emojiName: 'hurt', mood: 'Hurt'),
                        MoodButton(emojiName: 'nervous', mood: 'Nervous'),
                       
                    ],
                  ) ,
                  ),
              ),
            ),
            const SizedBox(height: 20,),
            Center(
              child: customButton(
                        tap: () {
                          // SecondPage();
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondPage()),
                          );
                        //  PageNavigator(context: context).nextPage(const Home());
                        },
                        icon: Icons.arrow_forward,
                        text: 'This is how I feel',
                        width: 200,
                        height: 60,
                        context: context),
            ),
            const SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}