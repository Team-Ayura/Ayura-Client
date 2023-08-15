import 'package:flutter/foundation.dart';

class WalkingAndRunningProvider extends ChangeNotifier {
  String selectedFilter = 'D'; // Default filter is 'D' for Day
  Map<String, int> stepsData = {}; // Data for steps taken on each day

  String timePeriod = "Aug 14";
  String daytimePeriod = "Aug 14";
  String weektimePeriod = "Aug 12 - Aug 14";
  String monthtimePeriod = "Aug 01 - Aug 14";
  String yeartimePeriod = "Jan 01 - Aug 14";

  double distance = 2.42; // Total distance covered
  double daydistance = 2.42;
  double weekdistance = 3.05;
  double monthdistance = 4.20;
  double yearsdistance = 3.31;

  int stepCount = 1208;
  int daystepCount = 1208;
  int weekstepcount = 1455;
  int monthstepcount = 2090;
  int yearstepcount = 1567;

  String duration = '1:23:00';
  String dayduration = '01:23:00';
  String weekduration = '01:44:00';
  String monthduration = '02:05:00';
  String yearduration = '01:52:00';

  int calorieCount = 456;
  int daycalorieCount = 456;
  int weekcalorieCount = 703;
  int monthcalorieCount = 1338;
  int yearcalorieCount = 815;

  int improvement = 12;
  int dayimprovement = 12;
  int weekimprovement = 14;
  int monthimprovement = 20;
  int yearimprovement = 15;

  List<int> daysteps = [
    0,
    0,
    0,
    0,
    0,
    0,
    420,
    174,
    0,
    0,
    0,
    115,
    80,
    221,
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
    0,
    0,
    420,
    174,
    0,
    0,
    0,
    115,
    80,
    221,
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
  List<int> weeksteps = [4375, 3198, 1042, 0, 0, 0, 0];
  List<int> monthsteps = [3287, 4345, 5032, 4098, 3590, 5045, 4211, 4756, 3800, 5265, 4422, 4375, 3198, 1042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  List<int> yearsteps = [4200, 5150, 3550, 4920, 4675, 3035, 5298, 4067, 0, 0, 0, 0];

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
    stepCount++;
    calorieCount++;
    improvement--;
    switch (selectedFilter) {
      case 'D':
        steps = daysteps;
        stepCount = daystepCount;
        calorieCount = daycalorieCount;
        improvement = dayimprovement;
        distance = daydistance;
        duration = dayduration;
        timePeriod = daytimePeriod;
        break;
      case 'W':
        steps = weeksteps;
        stepCount = weekstepcount;
        calorieCount = weekcalorieCount;
        improvement = weekimprovement;
        distance = weekdistance;
        duration = weekduration;
        timePeriod = weektimePeriod;
        break;
      case 'M':
        steps = monthsteps;
        stepCount = monthstepcount;
        calorieCount = monthcalorieCount;
        improvement = monthimprovement;
        distance = monthdistance;
        duration = monthduration;
        timePeriod = monthtimePeriod;
        break;
      case 'Y':
        steps = yearsteps;
        stepCount = yearstepcount;
        calorieCount = yearcalorieCount;
        improvement = yearimprovement;
        distance = yearsdistance;
        duration = yearduration;
        timePeriod = yeartimePeriod;
        break;
    }
    // steps[5]--;
    // After updating the state, notify listeners to rebuild widgets that depend on this provider.
    notifyListeners();
  }
}
