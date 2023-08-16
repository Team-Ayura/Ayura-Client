import 'package:flutter/foundation.dart';

class CyclingProvider extends ChangeNotifier {
  String selectedFilter = 'D'; // Default filter is 'D' for Day
  Map<String, int> stepsData = {}; // Data for steps taken on each day

  String timePeriod = "Aug 14";
  String daytimePeriod = "Aug 14";
  String weektimePeriod = "Aug 12 - Aug 14";
  String monthtimePeriod = "Aug 01 - Aug 14";
  String yeartimePeriod = "Jan 01 - Aug 14";

  double distance = 5.42; // Total distance covered
  double daydistance = 5.42;
  double weekdistance = 3.13;
  double monthdistance = 3.20;
  double yeardistance = 4.05;
  // int stepCount = 1208;
  String duration = '00:23:00';
  String dayduration = '00:23:00';
  String weekduration = '00:44:00';
  String monthduration = '00:55:00';
  String yearduration = '00:34:00';

  int calorieCount = 456;
  int daycalorieCount = 456;
  int weekcalorieCount = 703;
  int monthcalorieCount = 1338;
  int yearcalorieCount = 815;

  int improvement = 12;
  int dayimprovement = 12;
  int weekimprovement = 5;
  int monthimprovement = 7;
  int yearimprovement = 11;

  List<int> daysteps = [
    0,
    0,
    0,
    0,
    5,
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
  List<int> steps = [
    0,
    0,
    0,
    0,
    5,
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
  List<int> weeksteps = [5, 7, 5, 0, 0, 0, 0];
  List<int> monthsteps = [
    5,
    7,
    5,
    8,
    9,
    12,
    7,
    11,
    2,
    6,
    1,
    5,
    7,
    5,
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
  List<int> yearsteps = [5, 7, 5, 8, 9, 12, 7, 5, 0, 0, 0, 0];
  // Implement methods to fetch data from the server and update the provider state
  // For example: fetchWalkAndRunningData, updateStepsData, etc.

  void updateFilter(String filter) {
    selectedFilter = filter;
    // Fetch and update the stepsData and distance based on the selected filter
    // You should implement this logic based on how you fetch data from the server
    // and structure your data.
    // For example, if the selected filter is 'W' (Week), fetch weekly data and update the state.
    // Similarly for other filters.

    // testing code to check if the provider is working
    // stepCount++;
    calorieCount++;
    improvement--;
    switch (selectedFilter) {
      case 'D':
        steps = daysteps;
        calorieCount = daycalorieCount;
        improvement = dayimprovement;
        duration = dayduration;
        timePeriod = daytimePeriod;
        distance = daydistance;
        break;
      case 'W':
        steps = weeksteps;
        calorieCount = weekcalorieCount;
        improvement = weekimprovement;
        duration = weekduration;
        timePeriod = weektimePeriod;
        distance = weekdistance;
        break;
      case 'M':
        steps = monthsteps;
        calorieCount = monthcalorieCount;
        improvement = monthimprovement;
        duration = monthduration;
        timePeriod = monthtimePeriod;
        distance = monthdistance;
        break;
      case 'Y':
        steps = yearsteps;
        calorieCount = yearcalorieCount;
        improvement = yearimprovement;
        duration = yearduration;
        timePeriod = yeartimePeriod;
        distance = yeardistance;
        break;
    }
    // steps[5]--;
    // After updating the state, notify listeners to rebuild widgets that depend on this provider.
    notifyListeners();
  }
}
