import 'dart:math';

import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/provider/models/sportModel.dart';
import 'package:ayura/widgets/features/activity_tracking/multi_selection_popup.dart';
import 'package:flutter/material.dart';

class SportsProvider extends ChangeNotifier {
  ChartFilterType selectedFilter = ChartFilterType.day;
  String duration = '00:00';
  String timePeriod = "Aug 14";
  String daytimePeriod = "Aug 14";
  String weektimePeriod = "Aug 12 - Aug 14";
  String monthtimePeriod = "Aug 01 - Aug 14";
  String yeartimePeriod = "Jan 01 - Aug 14";
  int calorieCount = 0;
  int improvement = 0;
  List<int> dayduration = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  List<int> chartduration = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  List<int> weekduration = [0, 0, 0, 0, 0, 0, 0];
  List<int> monthduration = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
  ];
  List<int> yearduration = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,];
  List<SportModel> selectedSports = [];
  final List<SportModel> _allSports = [
    SportModel(
      id: '1',
      caloriesPerHour: 100,
      name: 'Basketball',
      averageDuration: 0,
      sportHistory: [],
    ),
    SportModel(
      id: '2',
      caloriesPerHour: 100,
      name: 'Cricket',
      averageDuration: 0,
      sportHistory: [],
    ),
    SportModel(
      id: '3',
      caloriesPerHour: 100,
      name: 'Swimming',
      averageDuration: 0,
      sportHistory: [],
    ),
    SportModel(
      id: '4',
      caloriesPerHour: 100,
      name: 'Badminton',
      averageDuration: 0,
      sportHistory: [],
    ),
    SportModel(
      id: '5',
      caloriesPerHour: 100,
      name: 'Tennis',
      averageDuration: 0,
      sportHistory: [],
    )
    // Add more sports as needed
  ];
  void addNewSport(List<SportModel> newSports) {
    selectedSports.addAll(newSports);
    notifyListeners();
  }

  void updateFilter(ChartFilterType filter) {
    selectedFilter = filter;
    // Fetch and update the stepsData and distance based on the selected filter
    // You should implement this logic based on how you fetch data from the server
    // and structure your data.
    // For example, if the selected filter is 'W' (Week), fetch weekly data and update the state.
    // Similarly for other filters.

    // testing code to check if the provider is working
    // stepCount++;
    // calorieCount++;
    // improvement--;
    switch (selectedFilter) {
      case ChartFilterType.day:
        chartduration = dayduration;
        timePeriod = daytimePeriod;
        break;
      case ChartFilterType.week:
        chartduration = weekduration;
        timePeriod = weektimePeriod;
        break;
      case ChartFilterType.month:
        chartduration = monthduration;
        timePeriod = monthtimePeriod;
        break;
      case ChartFilterType.year:
        chartduration = yearduration;
        timePeriod = yeartimePeriod;
        break;
    }
    // steps[5]--;
    // After updating the state, notify listeners to rebuild widgets that depend on this provider.
    notifyListeners();
  }

  void removeSportFromWorkspace(String sportId) {
    int indexdestination =
        _allSports.indexWhere((sport) => sport.id == sportId);
    int indexsource = selectedSports.indexWhere((sport) => sport.id == sportId);
    if (indexdestination != -1 && indexsource != -1) {
      _allSports[indexdestination] = selectedSports[indexsource];
      selectedSports.removeAt(indexsource);
      notifyListeners();
    }
  }

  List<Sport> remainingSports() {
    return _allSports
        .where((sport) => !selectedSports
            .any((selectedSport) => sport.id == selectedSport.id))
        .map((sport) => Sport(
              id: sport.id,
              name: sport.name,
              icon:
                  'assets/icons/features/activity_tracking/sports/${sport.name.trim().toLowerCase()}.svg',
              caloriesPerHour: sport.caloriesPerHour,
            ))
        .toList();
  }

  void addEntrySportHistory(
      String sportid, TimeOfDay startTime, TimeOfDay finishedTime) {
    List<int> minutesList = List.filled(24, 0);

    for (int i = startTime.hour; i <= finishedTime.hour; i++) {
      if (i == startTime.hour) {
        minutesList[i] = 60 - startTime.minute;
      } else if (i == finishedTime.hour) {
        minutesList[i] = finishedTime.minute;
      } else {
        minutesList[i] = 60;
      }
    }

    for (int i = 0; i < 12; i++) {
      dayduration[i] = min(60, dayduration[i] + minutesList[i]);
      chartduration[i] = min(60, chartduration[i] + minutesList[i]);
    }
    calorieCount += 27;

    // update the duration
    List<String> durationParts = duration.split(':');
    int hours = int.parse(durationParts[0]);
    int minutes = int.parse(durationParts[1]);
    int totalMinutes = (hours * 60) + minutes;
    hours += totalMinutes ~/ 60;
    minutes += totalMinutes % 60;
    duration = '$hours:$minutes';
    notifyListeners();
  }
}
