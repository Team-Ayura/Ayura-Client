import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/pages/features/sleep_tracking/page3.dart';
import 'package:ayura/widgets/global/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/router.dart';
import '../../../widgets/features/home/tips_card.dart';
import '../../../widgets/features/sleep_tracking/circletimepicker.dart';
import '../../../widgets/global/custom_app_bar.dart';

class CreateSchedule extends StatefulWidget {
  const CreateSchedule({super.key});
  

  @override
  State<CreateSchedule> createState() => _CreateScheduleState();
  
}

class _CreateScheduleState extends State<CreateSchedule> {
  String alarmTime = "12:00 PM";
  String bedTime = "12:00 AM";
  String sleepDuration = "12 hr 00 min";
  
   bool isNotificationOn = false;

  void toggleNotification(bool value) {
    setState(() {
      isNotificationOn = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    //  double smallerMarginRatio = 0.025;
    // double horizontalPadding = 0.08;
    // double verticalPadding = 0.05;
    // Size size = MediaQuery.of(context).size;


    return Scaffold(
      appBar:CustomAppBar(Icons.arrow_back_outlined,
          Icons.alarm_outlined, "Create Schedule",
          leftCallback: () => Navigator.of(context).pop(),
          rightCallback: ()=>PageNavigator(context: context).nextPage(const SleepSchedules())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: Column(children: [
          const SizedBox(height: 20.0,),
          tipsCard(
            height: 130.0,
            title: 'Important',
            descritpion:
                'Make sure that your schedule contains at least 6 - 7 sleep cycles.',
            cta: ' ',
            icon: Icons.lightbulb,
          ),
      
          const SizedBox(height: 10.0,),
          Card(
            elevation: 1, // Adjust elevation for shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
              leading: const Icon(Icons.notifications_none,color:AppColors.primaryColor),
              title: const Text('Notify me before 30 minutes.',style: AppStyles.subHeadingTextStyle3,),
              trailing: Switch(
                value: isNotificationOn,
                onChanged: toggleNotification,
              ),
            ),
          ),
      
          const SizedBox(height: 20.0,),
          const Row(
            children: [
              Text(
                "Recommended sleep  schedules",
                style:AppStyles.subheadingTextStyle2,
              ),
            ],
          ),
      
          const SizedBox(height: 20.0,),
          Card(
            elevation: 1, // Adjust elevation for shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
            ),
            child: ListTile(
               horizontalTitleGap: 25.0,
              contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 8),
              title: const Text('10:00 PM - 6.00 AM ',style: AppStyles.subHeadingTextStyle3,),
              subtitle: const Text("3 Sleep Cycles"),
              trailing: TextButton(onPressed: () {PageNavigator(context: context).nextPage( const SleepSchedules());}, child: const Text("Select"),)
            ),
          ),
          Card(
            elevation: 1, // Adjust elevation for shadow
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0), // Adjust the border radius
            ),
            child: ListTile(
               horizontalTitleGap: 25.0,
              contentPadding: const EdgeInsets.fromLTRB(15, 10, 10, 8),
              title: const Text('10:00 PM - 7.00 AM ',style: AppStyles.subHeadingTextStyle3,),
              subtitle: const Text("4 Sleep Cycles"),
              trailing: TextButton(onPressed: () {PageNavigator(context: context).nextPage( const SleepSchedules());}, child: const Text("Select"),)
            ),
          ),
      
          const SizedBox(height: 20.0,),
          const Row(
            children: [
              Text(
                "Create a Custom Schedule",
                style: AppStyles.subheadingTextStyle2,
              ),
            ],
          ),
      
          const SizedBox(height: 20.0,),
          const SetAlarm(),
          const SizedBox(height: 20.0,),

           Center(
              child: customButton(
                  tap: () {
                    PageNavigator(context: context).nextPage( const SleepSchedules());
                  },
                  icon: Icons.arrow_forward,
                  text: 'Add Schedule',
                  width: 200,
                  height: 60,
                  context: context),
          ),
           const SizedBox(height: 20.0,),
   
        ]),
       
      ),
    );
    
  }
}