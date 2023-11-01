import 'dart:convert';

import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/diary/HorizontalCalender.dart';
import 'package:ayura/widgets/features/diary/sleepTime.dart';
import 'package:ayura/widgets/features/mood_traking/mood_chips.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../provider/moodProviders/selectedmood.dart';
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

  List<Widget> generatedTipsWidgets = [];


  List<Tip> generatedTips = [
    Tip(
      title: 'Health tips',
      description:
      'Aim to drink at least 8 glasses (about 2 liters) of water daily!',
    ),
  ];


  // init state
  @override
  void initState() {
    super.initState();

    generatedTipsWidgets = generatedTips.map((tip) {
      return Column(
        children: [tipsCard(
          title: tip.title,
          descritpion: tip.description,
          height: 150.0,
          cta: '', // Set the desired height here
        ),
          SizedBox(height: 10.0,)
      ]
      );
    }).toList();


  }


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
    "Doing overtime",
    "Working Hard",
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
        preferredSize: const Size.fromHeight(110.0),
        // Set the preferred size here.
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
                        'Saman Perera',
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
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
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                    //activity chips
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 5, 8, 0),
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 8.0,
                          children: DailyActicities.map((factor) {
                            bool isSelected =
                                selectedDailyActicities.contains(factor);

                            return ChoiceChip(
                              label: Text(factor),
                              selected: isSelected,
                              onSelected: (isSelected) {
                                setState(() {
                                  if (isSelected) {
                                    selectedDailyActicities.add(factor);
                                    print(selectedDailyActicities);
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
                              backgroundColor: isSelected
                                  ? AppColors.primaryColor.withOpacity(0.2)
                                  : Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: isSelected
                                      ? AppColors.primaryColor.withOpacity(0.2)
                                      : AppColors.disabledColor,
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
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Tips for you',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //tips cards
                    Column(
                      children: generatedTipsWidgets,
                    ),
                    //elevated refresh button that calls the fucntion _generateTip and refreshes the list of tips
                    ElevatedButton(
                      onPressed: _generateTip,
                      child: const Text('Refresh'),
                    ),

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


  void updateGeneratedTips(List<Tip> newTips) {
    setState(() {
      generatedTips = newTips;
    });
  }

  void _generateTip() async {
    //get mood from mood provider
    String mood = Provider.of<MoodProvider>(context, listen: false).selectedMood;
    // format selectedDailyActivities to have a comma between each activity. and remove new lines, tabs
    String selectedDailyActivities = this.selectedDailyActicities.join(', ');
    // remove new lines from it as well
    selectedDailyActivities = selectedDailyActivities.replaceAll('\n', '').replaceAll('\t', '').replaceAll('[', '')
        .replaceAll(']', '');
    List<Tip> newTips = await _sendGPTRequest(
        mood, sleepDuration, selectedDailyActicities
    );
    updateGeneratedTips(newTips);
    _rebuildTipsSection();
  }

  void _rebuildTipsSection() {
    generatedTipsWidgets = generatedTips.map((tip) {
      return Column(
        children: [
          tipsCard(
            title: tip.title,
            descritpion: tip.description,
            height: 150.0,
            cta: '', // Set the desired height here
          ),
          SizedBox(height: 10.0)
        ],
      );
    }).toList();

    setState(() {}); // Trigger a rebuild of the UI
  }

}

class Tip {
  final String title;
  final String description;

  Tip({
    required this.title,
    required this.description,
  });
}


Future<List<Tip>> _sendGPTRequest(String selectedMood, String sleepDuration, List<String> selectedDailyActivities) async {
  List<Tip> tips = [];
  // add circular progress indicator here
  try {
    var response = await http.post(Uri.parse('http://10.0.2.2:5005/api/gpt'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'prompt': 'Send me a sample JSON code within brackets. With 5 objects of attributes title and description. Description should be short. Tips should be actionable tips that are tailor made to handle and manage the following details and scenarios. My sleep duration was $sleepDuration. My mood is $selectedMood. My activities include: ${selectedDailyActivities.join(', ')} ',

      }),);
    print(response.body);

    String jsonString = response.body;

// Remove line breaks and extra brackets
    jsonString =
        jsonString.replaceAll('\n', '').replaceAll('\t', '').replaceAll('[', '')
            .replaceAll(']', '');

    print(jsonString);

    jsonString = jsonString.replaceAll(RegExp(r'[\n\t]'), '');

// Check if the response starts and ends with double quotes, if so, remove them
    if (jsonString.startsWith('"') && jsonString.endsWith('"')) {
      jsonString = jsonString.substring(1, jsonString.length - 1);
    }

    print(jsonString);

    // remove '\' from the string
    jsonString = jsonString.replaceAll('\\n', '');

    jsonString = jsonString.replaceAll('\\t', '');

    print(jsonString);

    // remove "\" from the string
    jsonString = jsonString.replaceAll('\\', '');

    print(jsonString);

    // remove dot from beginning of the string
    jsonString = jsonString.replaceAll('.', '');

    print(jsonString);

    // enclose between [ ]
    jsonString = '[' + jsonString + ']';

    // convert into JSON
    List<dynamic> json = jsonDecode(jsonString);

    // map json to Tip objects
    tips = json.map((tip) {
      return Tip(
        title: tip['title'],
        description: tip['description'],
      );
    }).toList();

    return tips;

  } catch (e) {
    print(e);
    return tips;
  }
}
