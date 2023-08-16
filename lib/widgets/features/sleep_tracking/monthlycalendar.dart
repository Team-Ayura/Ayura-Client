import 'package:ayura/pages/features/sleep_tracking/page1.dart';
import 'package:ayura/pages/features/sleep_tracking/page2.dart';
import 'package:ayura/widgets/features/sleep_tracking/alarmdescription.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';
import '../../../constants/styles.dart';
import '../../../pages/features/sleep_tracking/sleepdetailspage.dart';
import '../../../utils/router.dart';

class SleepData {
  final DateTime date;
  final SleepQuality sleepQuality;

  SleepData(this.date, this.sleepQuality);
}

enum SleepQuality {
  Great,
  Good,
  Okay,
  Not_Great,
  Horrible,
}

// List<SleepData> sleepHistory = [
//   SleepData(DateTime(2023, 8, 12), SleepQuality.Good),
//   SleepData(DateTime(2023, 8, 13), SleepQuality.Great),
//   SleepData(DateTime(2023, 8, 14), SleepQuality.Horrible),
//   SleepData(DateTime(2023, 8, 15), SleepQuality.Okay),
//   // Add more sleep data here
// ];





class BaseCalendar extends StatefulWidget {
  @override
  _BaseCalendarState createState() => _BaseCalendarState();
}

class _BaseCalendarState extends State<BaseCalendar> {
  List<SleepData> sleepHistory = [
    SleepData(DateTime(2023, 8, 12), SleepQuality.Horrible),
    SleepData(DateTime(2023, 8, 13), SleepQuality.Great),
    SleepData(DateTime(2023, 8, 14), SleepQuality.Good),
    SleepData(DateTime(2023, 8, 15), SleepQuality.Okay),
    // Add more sleep data here
  ];

 Map<SleepQuality, Color> sleepQualityColors = { 
  SleepQuality.Great: const Color.fromARGB(255, 27, 158, 4),
  SleepQuality.Good: const Color(0xFF00DF59), 
  SleepQuality.Okay:   const Color(0xFFFFD600),
  SleepQuality.Not_Great: const Color.fromARGB(255, 232, 121, 1),
  SleepQuality.Horrible: const Color.fromARGB(255, 228, 8, 8),
};



  @override
 Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CalendarCarousel(
        onDayPressed:(DateTime date, List<SleepData> sleepDataList) {
          SleepQuality sleepQuality = SleepQuality.Good;

          for (SleepData sleepData in sleepDataList) {
            print('Checking sleep data for date: ${sleepData.date}');
            if (date == sleepData.date) {
              print('Found matching sleep data. Sleep quality: ${sleepData.sleepQuality}');
              sleepQuality = sleepData.sleepQuality;
              break;
            }
          }

          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SleepDetailsPage(date, sleepQuality),
          //   ),
          // );

          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SleepDetailsDialog(date, sleepQuality);
            },
          );
        },
        
        height: 380.0,
       

        headerTextStyle: const TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.w400),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 5,
      markedDateCustomTextStyle:const TextStyle(color: Colors.white),
      // markedDateIconBuilder: (event) => event.icon ?? const Icon(Icons.help_outline),
      showIconBehindDayText: true,
      

      selectedDateTime: DateTime.now(),
      selectedDayTextStyle: const TextStyle(color: AppColors.primaryColor),
      selectedDayButtonColor:const  Color.fromARGB(255, 243, 241, 241),
      todayTextStyle: const TextStyle(color: AppColors.primaryColor),
     
     
      weekdayTextStyle: const TextStyle(color:AppColors.shadowColor),
      todayButtonColor: Colors.transparent,
      todayBorderColor: AppColors.disabledColor,
      showOnlyCurrentMonthDate: true,






        customDayBuilder: (
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          List<SleepData> sleepDataList = sleepHistory.where((data) => isSameDay(data.date, day)).toList();

          Color sleepQualityColor = Colors.transparent;
          for (SleepData sleepData in sleepDataList) {
            sleepQualityColor = sleepQualityColors[sleepData.sleepQuality] ?? Colors.transparent;
            break; // Assume only one sleep quality per day
          }

            Color textColor = isNextMonthDay
              ? Colors.grey // Grey color for next month's days
              : isSelectable && (isToday || day.isBefore(DateTime.now().add(const Duration(days: 1))))
                  ? Colors.black // Black color for selectable past and today's dates
                  : Colors.grey; // Grey color for non-selectable future dates


          return Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: sleepQualityColor,
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: TextStyle(
                    color: textColor, // You can adjust the text color here
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}





class SleepDetailsDialog extends StatelessWidget {
  final DateTime date;
  final SleepQuality sleepQuality;

  

  SleepDetailsDialog(this.date, this.sleepQuality);

  @override
  Widget build(BuildContext context) {
    double smallerMarginRatio = 0.025;
    double horizontalPadding = 0.08;
    double verticalPadding = 0.05;
    Size size = MediaQuery.of(context).size;




    return AlertDialog(
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      // contentPadding: EdgeInsets.all(40.0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              Text("13 Aug 2023",style:AppStyles.subheadingTextStyle2),
               IconButton(
              onPressed: (){
                PageNavigator(context: context).nextPage( const SleepHistory());
              },
              icon: Icon(Icons.delete_outlined,color: AppColors.primaryColor,)
            )
            ],
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text('${date.year}-${date.month}-${date.day}'),
                       const Text("Sleep Quality",style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),),
                  Column(
                    children: [
                      SvgPicture.asset("assets/images/sleep_tracking/Good.svg"),
                      const SizedBox(width: 5,),
                      const Text('Good',style: TextStyle(
                            color: AppColors.textColor,
                            // fontWeight: FontWeight.bold,
                            fontSize: 14.0,
                          ),),
                    ],
                  ),
                    
                ],
              ),
              const SizedBox(width: 15,),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Sleep duration",
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 10,),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "08h 00m",
                            style: TextStyle(
                              color:AppColors.textColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        
                      ],
                    ),
                ],
              ),
            ],
          ),
             const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AlarmDescription(
                    iconData: Icons.bed,
                    title: "Bedtime",
                    width: size.width * 0.3,
                    time: "10:30 PM"),
                AlarmDescription(
                    iconData: Icons.notifications_none,
                    title: "Wake Up",
                    width: size.width * 0.3,
                    time: "06:30 AM")
              ],
            ),
          

          const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                children: [
                  Row(
                    children: [
                       Icon(Icons.light_mode),
                       SizedBox(width: 10,),
                      Text(
                        "Before Sleep",
                        style: TextStyle(
                          color:AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                    Wrap(
                      children: [
                        Chip(label:Text("Work")),
                        SizedBox(width: 10,),
                        Chip(label:Text("Stress")),
                        SizedBox(width: 10,),
                        Chip(label:Text("Pain")),
                      ],
                    ),
                ],
              )
              ],
            ),

            const SizedBox(height: 10,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.bed),
                       SizedBox(width: 10,),
                      Text(
                        "After Sleep",
                        style: TextStyle(
                          color:AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                    Wrap(
                      children: [
                        Chip(label:Text("Restful Sleep")),
                        SizedBox(width: 10,),
                        Chip(label:Text("Relax")),
                      ],
                    ),
                ],
              )
              ],
            ),


           

          // Add more sleep details here (bed time, wake up time, etc.)
          // You can use Text, ListTile, or any other widgets to display the details
        ],
      ),
    );
  }
}



