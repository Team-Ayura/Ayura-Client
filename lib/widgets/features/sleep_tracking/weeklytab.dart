import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/sleep_tracking/page1.dart';
import 'package:ayura/widgets/features/sleep_tracking/averagesleeptimecard.dart';
import 'package:ayura/widgets/features/sleep_tracking/biweekline_chart.dart';
import 'package:ayura/widgets/features/sleep_tracking/sleepqualitypiechart.dart';
import 'package:ayura/widgets/features/sleep_tracking/weeklinechart.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/styles.dart';
import '../../../pages/features/sleep_tracking/page3.dart';
import '../../../utils/router.dart';
import '../../global/tip_chip.dart';



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
                  const Row(
                    children: [
                      Text("Try these things to improve your sleep quality.",style: AppStyles.subHeadingTextStyle3,),
                    ],
                  ),
                  const SizedBox(height: 10.0,),
                   const TipChip(
                    title: "Consistent Schedule",
                    description:"Stick to a regular sleep schedule, even on weekends.",
                    image:"assets/images/sleep_tracking/sleep_schedule.jpg",
                  ),
                  const SizedBox(height: 10.0,),
                  const TipChip(
                    title: "Manage Stress",
                    description:"Practice relaxation techniques like deep breathing or meditation.",
                    image:"assets/images/mood_tracking/meditation.jpg",
                  ),
                  const SizedBox(height: 10.0,),
                    const TipChip(
                    title: "Limit Screen Time",
                    description:"Avoid screens (phones, tablets, TVs) before bedtime.",
                    image:"assets/images/sleep_tracking/screen_time.jpg",
                  ), 


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
}