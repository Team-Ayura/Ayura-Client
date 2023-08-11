import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/pages/features/mood_tracking/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

//Basic calendar view which can customize for duration
class BaseCalendar extends StatefulWidget {
  DateTime ? startdate;
  DateTime ? enddate;
  DateTime ? currentDate;
  String ? headerText;
  final double headermargintop;
  final double headermarginbottom;
  final double headermarginright;
  final EventList<Event> markedDateMap;
  final bool isScrollable;
  final bool weekFormat;
  final bool isheaderbutton;
  final bool isshowonlycurrentmonthdate;
  final double height;
  
  BaseCalendar({super.key, 
    this.startdate,
    this.enddate,
    this.currentDate,
    this.headerText,
    required this.headermargintop,
    required this.headermarginbottom,
    required this.headermarginright,
    required this.markedDateMap,
    required this.isScrollable,
    required this.weekFormat,
    required this.isheaderbutton,
    required this.isshowonlycurrentmonthdate,
    required this.height,
    
  });

  

  @override
  State<BaseCalendar> createState() => _BaseCalendarState();
}

class _BaseCalendarState extends State<BaseCalendar> {
   
  @override
  Widget build(BuildContext context) {
    
    final calendarCarousel =  CalendarCarousel<Event>(
      //pass the taken different arguments to calendar
      headerText: widget.headerText,
      markedDatesMap: widget.markedDateMap,
      isScrollable: widget.isScrollable,
      showOnlyCurrentMonthDate: widget.isshowonlycurrentmonthdate,
      weekFormat: widget.weekFormat,
      height: widget.height,
      showHeaderButton: widget.isheaderbutton,
      headerMargin: EdgeInsets.only(right:widget.headermarginright,top:widget.headermargintop,bottom:widget.headermarginbottom),

      //common properties for all calendars
      headerTextStyle: const TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.w400),
      markedDateShowIcon: true,
      markedDateIconMaxShown: 5,
      markedDateCustomTextStyle:const TextStyle(color: Colors.white),
      markedDateIconBuilder: (event) => event.icon ?? const Icon(Icons.help_outline),
      showIconBehindDayText: true,

      selectedDateTime: DateTime.now(),
      selectedDayTextStyle: const TextStyle(color: AppColors.primaryColor),
      selectedDayButtonColor:const  Color.fromARGB(255, 243, 241, 241),
      todayTextStyle: const TextStyle(color: AppColors.primaryColor),
     
     
      weekdayTextStyle: const TextStyle(color:AppColors.shadowColor),
      todayButtonColor: Colors.transparent,
      todayBorderColor: AppColors.disabledColor,
      
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
        //check if calendar type is monthly(monthly calendar does not exist startdate and enddate)
        if(widget.startdate !=null && widget.enddate !=null){
          //check dates are in the selected duration
          if (!day.isBefore(DateTime.now()) && !day.isAfter(widget.enddate ?? DateTime.now())) {
          // Disable interaction for future dates
            return Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: textStyle.copyWith(
                    color: AppColors.disabledColor, // grey to represent disabled state
                  ),
                ),
              ),
            );
          } else {
            if  ((widget.startdate == null || day.isAfter(widget.startdate!)) && (widget.enddate == null || day.isBefore(widget.enddate!))) {
                return InkWell(
                  onTap: () {
                    // Only navigate for past and today's dates
                    if (day.isBefore(DateTime.now().add(const Duration(days: 1)))) {
                      setState(() => widget.currentDate = day);
                      PageNavigator(context: context).nextPage(const SecondPage());
                    }
                  },
                  child: Center(
                    child: Text(
                      day.day.toString(),
                      style: textStyle,
                    ),
                  ),
                );
            } else {
              // Hide days outside the duraction range
              return Container();
            }
          }
        }
        //if calendar type is monthly
        else{
          //check future dates
          if (!day.isBefore(DateTime.now())) {
            // Disable interaction for future dates
              return Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Center(
                  child: Text(
                    day.day.toString(),
                    style: textStyle.copyWith(
                      color: AppColors.disabledColor, // Use any color to represent disabled state
                    ),
                  ),
                ),
              );
          } 
          //past and today dates
          else {
            return InkWell(
              onTap: () {
                // Only navigate for past and today's dates
                if (day.isBefore(DateTime.now().add(const Duration(days: 1)))) {
                  setState(() => widget.currentDate = day);
                 PageNavigator(context: context).nextPage(const SecondPage());
                }
              },
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: textStyle,
                ),
              ),
            );
          }
        }
        
      },

    );

    return Container(
        decoration: AppStyles.containerDecoration,
        margin: const EdgeInsets.symmetric(horizontal: 15.0),
        child: calendarCarousel,
      );
  }
}











