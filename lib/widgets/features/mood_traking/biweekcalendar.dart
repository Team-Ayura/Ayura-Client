import 'package:flutter/material.dart';
import 'package:intl/intl.dart' 
show DateFormat;
import 'calendarviews.dart';

class BiweekCalendar extends StatefulWidget {
  const BiweekCalendar({super.key});

  @override
  State<BiweekCalendar> createState() => _BiweekCalendarState();
}

class _BiweekCalendarState extends State<BiweekCalendar> {
  late DateTime _currentDate;
  late DateTime _startOfWeek;
  late DateTime _endOfWeek;
  late String _minSelectedDate;
  late String _maxSelectedDate;

    @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _startOfWeek = _currentDate.subtract(Duration(days: _currentDate.weekday + 1));
    _endOfWeek = _startOfWeek.add(const Duration(days: 14));
    _minSelectedDate = DateFormat.MMMd().format( _startOfWeek.add(const Duration(days:1))) ;
    _maxSelectedDate = DateFormat.MMMd().format(_endOfWeek) ;
  }

  @override
  Widget build(BuildContext context) {
 
     //pass the specific propert values to BaseCalendar
    return BaseCalendar(
      startdate: _startOfWeek,
      enddate: _endOfWeek,
      currentDate: _currentDate,
      headerText: "$_minSelectedDate - $_maxSelectedDate",
      headermargintop: 10,
      headermarginbottom: 10,
      headermarginright: 220,
      isheaderbutton: false,
      isshowonlycurrentmonthdate: false,
      isScrollable: false, 
      weekFormat: false,    
      height: 200.0,     
    );
  }
}