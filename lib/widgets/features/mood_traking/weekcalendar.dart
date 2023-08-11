import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:intl/intl.dart' 
show DateFormat;
import 'calendarviews.dart';

class WeekCalendar extends StatefulWidget {
  const WeekCalendar({super.key});

  @override
  State<WeekCalendar> createState() => _WeekCalendarState();
}

class _WeekCalendarState extends State<WeekCalendar> {
  late DateTime _currentDate;
  late DateTime _startOfWeek;
  late DateTime _endOfWeek;
  late String _minSelectedDate;
  late String _maxSelectedDate;

   final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2023, 7, 30): [
        Event(
            date: DateTime(2023, 7, 30),
            icon: const CircleAvatar(radius: 10, backgroundColor: Colors.green)),
      ],
      DateTime(2023, 7, 31): [
        Event(
            date: DateTime(2023, 7, 31),
            icon: const CircleAvatar(radius: 10, backgroundColor: Colors.lightGreen,)
            ),
      ],
      DateTime(2023, 8, 1): [
        Event(
            date: DateTime(2023, 8, 1),
            icon: const CircleAvatar(radius: 10, backgroundColor: Colors.yellow,)
            ),
      ],
    },
  );

    @override
  void initState() {
    super.initState();
    _currentDate = DateTime.now();
    _startOfWeek = _currentDate.subtract(Duration(days: _currentDate.weekday + 1));
    _endOfWeek = _startOfWeek.add(const Duration(days: 7));
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
      markedDateMap: _markedDateMap,
      isScrollable: false, 
      weekFormat: true,    
      height: 150.0,       
    );
  }
}