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

import '../../../widgets/features/home/tips_card.dart';

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

  List<String> DailyActicities = [
    "Going to the gym",
    "Going to the school",
    "Going to the work",
    "Reading books",
    "Volunteering",
    "Gardening",
    "Playing sports",
    "Watching movies or TV shows",
    "Cooking or baking",
    "Painting or drawing",
    "Hiking or nature walks",
    "Yoga or meditation",
    "Playing musical instruments",
    "Listening to podcasts or music",
    
 

    // Add more factors as needed
  ];

  String getGreeting() {
    final currentTime = DateTime.now();
    final hour = currentTime.hour;

    if (hour < 12) {
      return 'Good Morning!';
    } else if (hour < 17) {
      return 'Good Afternoon!';
    } else {
      return 'Good Evening!';
    }
  }

  List<String> selectedDailyActicities = [];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    String greeting = getGreeting();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize:
      //       const Size.fromHeight(60.0), // Set the preferred size here.
      //   child: PreferredSize(
      //     preferredSize: const Size.fromHeight(90.0),
      //     child: CustomAppBar(
      //       Icons.arrow_back,
      //       Icons.more_vert,
      //       'Diary',
      //       leftCallback: () => Navigator.pop(context),
      //     ),
      //   ),
      // ),
       appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(110.0), // Set the preferred size here.
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0,
          toolbarHeight: 110.0,
          title: Padding(
            padding: EdgeInsets.fromLTRB(
                width * 0.05, height * 0.07, width * 0.05, height * 0.04),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        greeting,
                        style: const TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.textColor,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                      const Text(
                        'Namadee Shakya',
                        style: TextStyle(
                            fontFamily: "Inter",
                            color: AppColors.textColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.notifications_outlined,
                        color: AppColors.textColor,
                        size: 35,
                      ),
                      SizedBox(width: width * 0.02),
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/profileIcon.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          // height: MediaQuery.of(context).size.height,
          // shrinkWrap: true,
          children: [
            Padding(
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

                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('How are you feeling today ?',
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                    //moods chips
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 6.0,
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
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('What have you been up to?',
                          style:
                              TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                    //activity chips
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                      child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: DailyActicities.map((factor) {
                            bool isSelected = selectedDailyActicities.contains(factor);
                                
                            return ChoiceChip(
                              label: Text(factor),
                              selected: isSelected,
                              onSelected: (isSelected) {
                                setState(() {
                                  if (isSelected) {
                                    selectedDailyActicities.add(factor);
                                  } else {
                                    selectedDailyActicities.remove(factor);
                                  }
                                });
                              },
                              selectedColor: AppColors.primaryColor,
                              labelStyle: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.normal,
                              ),
                              backgroundColor: isSelected ?AppColors.primaryColor.withOpacity(0.2) : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                color: isSelected ? AppColors.primaryColor.withOpacity(0.2) : AppColors.disabledColor,
                                width: 1.0, // Adjust the width as needed
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelPadding: const EdgeInsets.all(3.0),
                            );
                          }).toList(),
                        ),
                    ),
                  ),

                     const SizedBox(
                      height: 10,
                    ),

                    tipsCard(
                    height: height * 0.15,
                    title: 'Health tips',
                    descritpion:
                        'Aim to drink at least 8 glasses (about 2 liters) of water daily!',
                    cta: ' ',
                    icon: Icons.lightbulb,
                  ),
                  const SizedBox(
                      height: 10,
                    ),
                  tipsCard(
                    height: height * 0.15,
                    title: 'Health tips',
                    descritpion:
                        'Aim to drink at least 8 glasses (about 2 liters) of water daily!',
                    cta: ' ',
                    icon: Icons.lightbulb,
                  ),
                  const SizedBox(
                      height: 10,
                    ),
                  tipsCard(
                    height: height * 0.15,
                    title: 'Health tips',
                    descritpion:
                        'Aim to drink at least 8 glasses (about 2 liters) of water daily!',
                    cta: ' ',
                    icon: Icons.lightbulb,
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
          ],
        ),
      ),
      bottomNavigationBar: const AppNavigation(),
    );
  }
}
