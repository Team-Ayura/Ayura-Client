import 'package:flutter/material.dart';
import 'calendarviews.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({super.key});

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late DateTime _currentDate;

    @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
  
    //pass common properties to the BaseCalendar
    return BaseCalendar(
      currentDate: _currentDate,
      enddate:DateTime(DateTime.now().year, DateTime.now().month, 1),
      headermargintop: 10,
      headermarginbottom: 10,
      headermarginright: 0,
      isheaderbutton: true,
      isshowonlycurrentmonthdate: true,
      // markedDateMap: markedDateMap,
      isScrollable: true, 
      weekFormat: false,   
      height: 430.0,   
      
    );
  }
}

