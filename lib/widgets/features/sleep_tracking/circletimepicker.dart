// ignore_for_file: unused_local_variable

import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/sleep_tracking/alarmdescription.dart';
import 'package:flutter/material.dart';
import 'package:time_duration_picker/time_duration_picker.dart';

class SetAlarm extends StatefulWidget {
  const SetAlarm({Key? key}) : super(key: key);

  @override
  State<SetAlarm> createState() => _SetAlarmState();
}

class _SetAlarmState extends State<SetAlarm> {
  String alarmTime = "12:00 PM";
  String bedTime = "12:00 AM";
  String sleepDuration = "12 hr 00 min";
  @override
  Widget build(BuildContext context) {
    double smallerMarginRatio = 0.025;
    double horizontalPadding = 0.08;
    double verticalPadding = 0.05;
    Size size = MediaQuery.of(context).size;

    return  Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration:const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          TimeDurationPicker(
            diameter: size.width * 0.6,
            icon1Data: Icons.notifications_none,
            icon2Data: Icons.bed,
            iconColor: Colors.white,
            knobDecoration: const BoxDecoration(
                color: AppColors.primaryColor),
            clockDecoration: const BoxDecoration(
                gradient: RadialGradient(colors: [
              AppColors.primaryColor,
              Colors.white
            ])),
            knobBackgroundDecoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor, //trackcolor
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                   Colors.white,
                   Color.fromRGBO(218, 224, 238, 1),
                ],
                stops: [0.1, 1],
              ),
            ),
            onIcon1RotatedCallback: (value) {
              setState(() {
                alarmTime = value;
              });
            },
            onIcon2RotatedCallback: (value) {
              setState(() {
                bedTime = value;
              });
            },
            setDurationCallback: (value) {
              setState(() {
                sleepDuration = value;
              });
            },
          ),
          SizedBox(height: size.height * 1 * smallerMarginRatio),
          SizedBox(
            width: size.width * 0.45,
            child: Column(
              children: [
                
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    sleepDuration,
                    style: const TextStyle(
                      color:AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
                const Text(
                  "Sleep duration",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
           SizedBox(height: size.height * 1 * smallerMarginRatio),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AlarmDescription(
                    iconData: Icons.bed,
                    title: "Bedtime",
                    width: size.width * 0.4,
                    time: bedTime),
                AlarmDescription(
                    iconData: Icons.notifications_none,
                    title: "Wake Up",
                    width: size.width * 0.4,
                    time: alarmTime)
              ],
            ),
        ],
      ),
    );
    
            
  }
}
