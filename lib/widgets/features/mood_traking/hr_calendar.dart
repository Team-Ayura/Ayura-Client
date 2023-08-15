// import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../provider/moodProviders/selectedmood.dart';


class DateModel {
  final DateTime date;
  DateModel(this.date);
}


class HR_Calendar extends StatefulWidget {
  final DateTime? selectedDate;

  const HR_Calendar({super.key, this.selectedDate});

  @override
  _HR_CalendarState createState() => _HR_CalendarState(selectedDate);
}

class _HR_CalendarState extends State<HR_Calendar> {
  // late DateTime _selectedDate;
  late DateTime _startDate;
  late DateTime _endDate;
  int _selectedBoxIndex = -1;

  @override

   _HR_CalendarState(DateTime? selectedDate) {
    _initializeDates(selectedDate ?? DateTime.now());
  }

  void _initializeDates(DateTime selectedDate) {
    final now = DateTime.now();
    _startDate = selectedDate.subtract(Duration(days: selectedDate.weekday));
    // if (selectedDate != now) {
    //   _endDate =
    //       selectedDate.add(Duration(days: DateTime.daysPerWeek - selectedDate.weekday - 2));
    // } else {
    //   _endDate = now;
    // }
    _endDate = now;
    _selectedBoxIndex = selectedDate.weekday;
  }

  @override
  Widget build(BuildContext context) {
    List<DateModel> dates = generateDateList();

    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            DateTimelinePicker(
              dates: dates,
              selectedBoxIndex: _selectedBoxIndex,
              onBoxTap: (index) {
                setState(() {
                  _selectedBoxIndex = index;
                });
              },
            ),
          ],
        ),
    );
  }

  List<DateModel> generateDateList() {
  List<DateModel> dateList = [];
  DateTime currentDate = _startDate;
  DateTime today = DateTime.now();

  while (currentDate.isBefore(_endDate)) {
    dateList.add(DateModel(currentDate));
    currentDate = currentDate.add(const Duration(days: 1));
  }

  if (_endDate.isAfter(today)) {
    _endDate = today;
  }

  return dateList;
  }
}

class DateTimelinePicker extends StatelessWidget {
  final List<DateModel> dates;
  final int selectedBoxIndex;
  final Function(int) onBoxTap;

  const DateTimelinePicker({super.key, 
    required this.dates,
    required this.selectedBoxIndex,
    required this.onBoxTap,
  });

  @override
  Widget build(BuildContext context) {
     final moodProvider = Provider.of<MoodProvider>(context);// Add this line
    return Container(
      height: 130.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        
        itemBuilder: (context, index) {
          final dateModel = dates[index];
          // String formattedMonth = DateFormat.MMM().format(dateModel.date);
          // DateTime formateteddatemodeldate = DateFormat.YYYY.M.D(dateModel.date);

          MoodHistory? moodHistory; // Initialize with null

          // Find the mood history for the current date
          for (var history in moodProvider.moodHistory) {
            print('Mood History: ${history.date}');
            print('Date: ${dateModel.date}');
            if ( _isSameDay(history.date, dateModel.date)) {
              moodHistory = history;
              break;
            }
          }

        

          
          // print('Mood History: ${moodHistory?.date}');
          print('Mood History mood: ${moodHistory?.mood}');

          return GestureDetector(
            onTap: () {
              onBoxTap(index);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60.0,
                width: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: selectedBoxIndex == index ? Colors.blue : Colors.transparent,
                    width: 1.0,
                    style: BorderStyle.solid,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      dateModel.date.day.toString(),
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      DateFormat.MMM().format(dateModel.date),
                      style: const TextStyle(color: Color.fromARGB(255, 128, 126, 126)),
                    ),
                    SizedBox(height: 10),
                   
                      // ignore: unnecessary_null_comparison
                       if (moodHistory != null)
                        SvgPicture.asset(
                          'assets/images/mood_tracking/${moodHistory.mood}.svg',
                        ),
                      if (moodHistory == null) // Add a placeholder or nothing
                        //  SvgPicture.asset(
                        //   'assets/images/mood_tracking/Bored.svg',
                        // ),
                        SizedBox(
                          width: 24,
                          height: 24,
                          // You can add a placeholder icon or leave it empty
                          
                        ),

                        
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

 // Compare only the date parts of two DateTime objects
  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
