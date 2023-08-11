import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'calendarviews.dart';

class MonthCalendar extends StatefulWidget {
  const MonthCalendar({super.key});

  @override
  State<MonthCalendar> createState() => _MonthCalendarState();
}

class _MonthCalendarState extends State<MonthCalendar> {
  late DateTime _currentDate;
 
   final EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2023, 7, 30): [
        Event(
            date: DateTime(2023, 7, 30),
            icon:const CircleAvatar(radius: 10, backgroundColor: Colors.green)),
      ],
      DateTime(2023, 7, 31): [
        Event(
            date: DateTime(2023, 7, 31),
            icon:const CircleAvatar(radius: 10, backgroundColor: Colors.lightGreen,)
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
  }

  @override
  Widget build(BuildContext context) {
    //pass common properties to the BaseCalendar
    return BaseCalendar(
      currentDate: _currentDate,
      headermargintop: 10,
      headermarginbottom: 10,
      headermarginright: 0,
      isheaderbutton: true,
      isshowonlycurrentmonthdate: true,
      markedDateMap: _markedDateMap,
      isScrollable: true, 
      weekFormat: false,   
      height: 430.0,     
    );
  }
}

