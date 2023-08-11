// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';


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
    _initializeDates(selectedDate);
  }

  void _initializeDates(DateTime? selectedDate) {
    // final selectedDate = _selectedDate ?? DateTime.now();

    final now = DateTime.now();
    selectedDate ??= now;
    _startDate = selectedDate.subtract(Duration(days: selectedDate.weekday));
    _endDate = selectedDate.add(Duration(days: DateTime.daysPerWeek - selectedDate.weekday - 1));
    _selectedBoxIndex = selectedDate.weekday - 1;
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

  while (currentDate.isBefore(_endDate.add(const Duration(days: 1)))) {
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
    return SizedBox(
      height: 130.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (context, index) {
          final dateModel = dates[index];
          String formattedMonth = DateFormat.MMM().format(dateModel.date);

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
                    const SizedBox(height: 10),
                    SvgPicture.asset(
                      'assets/images/bored.svg',
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
