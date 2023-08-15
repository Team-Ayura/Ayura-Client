
import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/features/sleep_tracking/page2.dart';
import 'package:ayura/pages/features/sleep_tracking/page4.dart';
import 'package:flutter/material.dart';

import '../../../utils/router.dart';
import '../../../widgets/global/custom_app_bar.dart';


class SleepSchedule {
  final String day;
  TimeOfDay bedtime;
  TimeOfDay wakeup;
  bool isBedtimeOn;
  bool isWakeupOn;

  SleepSchedule(this.day, this.bedtime, this.wakeup, this.isBedtimeOn, this.isWakeupOn);
}

class SleepSchedules extends StatefulWidget {
  const SleepSchedules({super.key});

  @override
  State<SleepSchedules> createState() => _SleepSchedulesState();
}

class _SleepSchedulesState extends State<SleepSchedules> {
  List<SleepSchedule> sleepSchedules = [
    SleepSchedule('Today', const TimeOfDay(hour: 22, minute: 0), const TimeOfDay(hour: 6, minute: 0), false, false),
    SleepSchedule('Tomorrow', const TimeOfDay(hour: 23, minute: 0), const TimeOfDay(hour: 7, minute: 0), false, false),
    SleepSchedule('Thursday', const TimeOfDay(hour: 21, minute: 30), const TimeOfDay(hour: 6, minute: 30), false, false),
    SleepSchedule('Friday', const TimeOfDay(hour: 23, minute: 0), const TimeOfDay(hour: 6, minute: 0), false, false),
    SleepSchedule('Saturday', const TimeOfDay(hour: 22, minute: 0), const TimeOfDay(hour: 5, minute:30), false, false),
    SleepSchedule('Sunday', const TimeOfDay(hour: 21, minute: 0), const TimeOfDay(hour: 6, minute: 0), false, false),
    
    // Add more schedules for different days
  ];

  void toggleBedtime(int index) {
    setState(() {
      sleepSchedules[index].isBedtimeOn = !sleepSchedules[index].isBedtimeOn;
    });
  }

  void toggleWakeup(int index) {
    setState(() {
      sleepSchedules[index].isWakeupOn = !sleepSchedules[index].isWakeupOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBar(Icons.arrow_back_outlined,
          Icons.add, "Sleep Schedule",
          leftCallback: () => PageNavigator(context: context).nextPage(const SleepHistory()),
          rightCallback: ()=>PageNavigator(context: context).nextPage(const CreateSchedule())),
      body: Container(
        padding: const EdgeInsets.fromLTRB(15, 15 , 15, 0),
        child: ListView.builder(
              itemCount: sleepSchedules.length,
              itemBuilder: (context, index) {
                final schedule = sleepSchedules[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(schedule.day,style: AppStyles.subheadingTextStyle2,),
                        TextButton(onPressed: (){PageNavigator(context: context).nextPage( const CreateSchedule());}, child: const Text("Edit")),
                    ],),
                    const SizedBox(height: 10.0,),
                    Card(
                      elevation: 1, // Adjust elevation for shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
                      ),
                      child: ListTile(
                        horizontalTitleGap: 25.0,
                        contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 8),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.nights_stay_outlined,color: AppColors.primaryColor,size: 35,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bedtime: ${schedule.bedtime.format(context)}',style: AppStyles.subHeadingTextStyle3,),
                                const Text('6 hours and 21 min more'),
                              ],
                            ),
                            Switch(
                              value: schedule.isBedtimeOn,
                              onChanged: (value) => toggleBedtime(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10.0,),
                     Card(
                      elevation: 1, // Adjust elevation for shadow
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
                      ),
                      child: ListTile(
                        horizontalTitleGap: 25.0,
                        contentPadding: const EdgeInsets.fromLTRB(15, 10,10, 8),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(Icons.wb_sunny,color: AppColors.primaryColor,size: 35,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('WakeUp time: ${schedule.wakeup.format(context)}',style: AppStyles.subHeadingTextStyle3,),
                                const Text('12 hours and 21 min more'),
                              ],
                            ),
                            Switch(
                              value: schedule.isWakeupOn,
                              onChanged: (value) => toggleWakeup(index),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0,),
                  ],
                );
              },
            ),
      ),
    );
  }
}