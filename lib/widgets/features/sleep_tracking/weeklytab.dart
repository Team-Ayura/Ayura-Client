import 'dart:convert';

import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/sleep_tracking/page1.dart';
import 'package:ayura/widgets/features/sleep_tracking/averagesleeptimecard.dart';
import 'package:ayura/widgets/features/sleep_tracking/biweekline_chart.dart';
import 'package:ayura/widgets/features/sleep_tracking/sleepqualitypiechart.dart';
import 'package:ayura/widgets/features/sleep_tracking/weeklinechart.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../constants/styles.dart';
import '../../../pages/features/Diary/diary_list.dart';
import '../../../pages/features/sleep_tracking/page3.dart';
import '../../../utils/router.dart';
import '../../global/tip_chip.dart';
import '../home/tips_card.dart';




class WeeklyTab extends StatefulWidget {
  const WeeklyTab({super.key});

  @override
  State<WeeklyTab> createState() => _WeeklyTabState();
}
  DateTime now = DateTime.now();
  DateTime currentWeekStart = now.subtract(Duration(days: now.weekday));
  DateTime currentWeekEnd = currentWeekStart.add(Duration(days: 6));

  // Format the dates if needed
  String formattedStartDate = DateFormat('MMM dd').format(currentWeekStart);
  String formattedEndDate = DateFormat('MMM dd').format(currentWeekEnd);

List<Widget> generatedTipsWidgets = [];

Map<String,double> dataMap = {
  "Excessive Sleep Days": 1,
  "Good Sleep Days": 1,
  "Sufficient Sleep Days": 1,
  "Insufficient Sleep Days": 2,

};

List<Tip> generatedTips = [
  Tip(
    title: 'Health tips',
    description:
    'Take Enough Sleep',
  ),
];

class _WeeklyTabState extends State<WeeklyTab> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child:Column(
                children:[
                    const SizedBox(height: 10,),  
                    Padding(
                     padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                     child: Row(
                      children: [
                        Text("$formattedStartDate-$formattedEndDate",style: AppStyles.subheadingTextStyle2,)
                      ],
                    ),
                   ),
                  const SizedBox(height: 10,),   
                  const AverageSleepCard(duration: 'Weekly',),


                  const SizedBox(height: 10,),
                  SleepQualitynChart(),

                  
                  
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
                  //   child: Card(
                  //   elevation: 1, // Adjust elevation for shadow
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
                  //   ),
                  //   child: ListTile(
                  //       horizontalTitleGap: 25.0,
                  //     contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 8),
                  //     title: const Text('Check your daily sleep schedules ',style: TextStyle(
                  //       fontFamily: 'Inter',
                  //       fontSize: 16,
                  //       fontWeight: FontWeight.w700,
                  //       color: AppColors.primaryColor,
                  //     )),
                  //     subtitle: const Text("Establish a consistent Sleep Schedule"),
                  //     trailing: TextButton(onPressed: () {PageNavigator(context: context).nextPage( const SleepSchedules());}, child:const Icon( Icons.arrow_forward,))
                  //   ),
                  //                 ),
                  // ),

                  const SizedBox(height: 10,),
                  const WeeklyChart(),

                  const SizedBox(height: 10.0,),
                  const Text("Tips for you",style: AppStyles.subHeadingTextStyle3,),
                  const SizedBox(height: 10.0,),
                  Column(
                    children: generatedTipsWidgets,
                  ),
                  //
                  // const Row(
                  //   children: [
                  //     Text("Try these things to improve your sleep quality.",style: AppStyles.subHeadingTextStyle3,),
                  //   ],
                  // ),
                  // const SizedBox(height: 10.0,),
                  //  const TipChip(
                  //   title: "Consistent Schedule",
                  //   description:"Stick to a regular sleep schedule, even on weekends.",
                  //   image:"assets/images/sleep_tracking/sleep_schedule.jpg",
                  // ),
                  // const SizedBox(height: 10.0,),
                  // const TipChip(
                  //   title: "Manage Stress",
                  //   description:"Practice relaxation techniques like deep breathing or meditation.",
                  //   image:"assets/images/mood_tracking/meditation.jpg",
                  // ),
                  // const SizedBox(height: 10.0,),
                  //   const TipChip(
                  //   title: "Limit Screen Time",
                  //   description:"Avoid screens (phones, tablets, TVs) before bedtime.",
                  //   image:"assets/images/sleep_tracking/screen_time.jpg",
                  // ),


                  Center(
                  child: customButton(
                      tap: () {
                        PageNavigator(context: context).nextPage( const SleepFirstPage());
                      },
                      icon: Icons.arrow_forward,
                      text: 'Enter Data',
                      width: 200,
                      height: 60,
                      context: context),
                ),


                ],
              ),
            );
  }


  void updateGeneratedTips(List<Tip> newTips) {
    setState(() {
      generatedTips = newTips;
    });
  }

  void _generateTip() async {
// remove new lines from it as well
  String sleepData = dataMap.toString().replaceAll('\n', '').replaceAll('\t', '');
    List<Tip> newTips = await _sendGPTRequest(sleepData
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
Future<List<Tip>> _sendGPTRequest(String sleepData) async {
  List<Tip> tips = [];
  // add circular progress indicator here
  try {
    var response = await http.post(Uri.parse('http://10.0.2.2:5005/api/gpt'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'prompt': 'Send me a sample JSON code within brackets. With 5 objects of attributes title and description. Description should be short. Tips should be actionable tips that are tailor made to help me with my sleep. My Sleep for the past week has been {sleepData}. Analyze how much sleep I have been getting and give me tips to improve my sleep accordingly.',

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

