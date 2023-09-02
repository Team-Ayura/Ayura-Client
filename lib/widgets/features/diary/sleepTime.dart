import 'package:ayura/constants/colors.dart';
import 'package:ayura/widgets/features/sleep_tracking/alarmdescription.dart';
import 'package:flutter/material.dart';
import 'package:time_duration_picker/time_duration_picker.dart';

class SleepTime extends StatelessWidget {
  final String alarmTime;
  final String bedTime;
  final String sleepDuration;
  final Function(String) onAlarmTimeChanged;
  final Function(String) onBedTimeChanged;
  final Function(String) onSleepDurationChanged;

  const SleepTime({
    Key? key,
    required this.alarmTime,
    required this.bedTime,
    required this.sleepDuration,
    required this.onAlarmTimeChanged,
    required this.onBedTimeChanged,
    required this.onSleepDurationChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double smallerMarginRatio = 0.015;
    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          TimeDurationPicker(
            diameter: size.width * 0.4,
            icon1Data: Icons.notifications_none,
            icon2Data: Icons.bedtime,
            iconColor: Colors.white,
            knobDecoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            knobBackgroundDecoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor, //trackcolor
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color.fromARGB(255, 233, 240, 250),
                  Color.fromRGBO(218, 224, 238, 1),
                ],
                stops: [0.1, 1],
              ),
            ),
            onIcon1RotatedCallback: onAlarmTimeChanged,
            onIcon2RotatedCallback: onBedTimeChanged,
            setDurationCallback: onSleepDurationChanged,
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
                      color: AppColors.textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.0,
                    ),
                  ),
                ),
                const Text(
                  "Sleep duration",
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 15.0,
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
                time: bedTime,
              ),
              AlarmDescription(
                iconData: Icons.notifications_none,
                title: "Wake Up",
                width: size.width * 0.4,
                time: alarmTime,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
