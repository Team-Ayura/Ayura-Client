import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/widgets/features/diary/HorizontalCalender.dart';
import 'package:ayura/widgets/features/diary/sleepTime.dart';
import 'package:ayura/widgets/features/mood_traking/hr_calendar.dart';
import 'package:ayura/widgets/features/mood_traking/mood_chips.dart';
import 'package:ayura/widgets/features/sleep_tracking/circletimepicker.dart';
import 'package:ayura/widgets/features/sleep_tracking/sleepquality.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
import 'package:ayura/widgets/global/custom_app_bar.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryList extends StatefulWidget {
  const DiaryList({Key? key}) : super(key: key);

  @override
  DiaryListState createState() => DiaryListState();
}

class DiaryListState extends State<DiaryList> {
  TimeOfDay? selectedTime;
  String alarmTime = "12:00 PM";
  String bedTime = "12:00 AM";
  String sleepDuration = "12 hr 00 min";

  void onAlarmTimeChanged(String value) {
    setState(() {
      alarmTime = value;
    });
  }

  void onBedTimeChanged(String value) {
    setState(() {
      bedTime = value;
    });
  }

  void onSleepDurationChanged(String value) {
    setState(() {
      sleepDuration = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(60.0), // Set the preferred size here.
        child: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
          child: CustomAppBar(
            Icons.arrow_back,
            Icons.more_vert,
            'Diary',
            leftCallback: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  //Horizontal calander
                  const HorizontalCalender(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('MMM d').format(DateTime.now())),
                      Text(DateFormat('hh:mm a').format(DateTime.now()))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text('How well did you sleep today ?',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  SleepTime(
                    alarmTime: alarmTime,
                    bedTime: bedTime,
                    sleepDuration: sleepDuration,
                    onAlarmTimeChanged: onAlarmTimeChanged,
                    onBedTimeChanged: onBedTimeChanged,
                    onSleepDurationChanged: onSleepDurationChanged,
                  ),

                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text('How are you feeling today ?',
                        style:
                            TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                  ),
                  //moods chips
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children: [
                          MoodButton(emojiName: 'Happy', mood: 'Happy'),
                          MoodButton(emojiName: 'Tired', mood: 'Tired'),
                          MoodButton(emojiName: 'Sad', mood: 'Sad'),
                          MoodButton(emojiName: 'Angry', mood: 'Angry'),
                          MoodButton(emojiName: 'Bored', mood: 'Bored'),
                          MoodButton(emojiName: 'Stressed', mood: 'Stressed'),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  customButton(
                      tap: (() {}), width: 100, text: 'Save', context: context),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}
