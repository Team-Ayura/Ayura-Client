import 'package:flutter/foundation.dart';

class StairsProvider extends ChangeNotifier {
  String selectedFilter = 'D'; // Default filter is 'D' for Day
  Map<String, int> stepsData = {}; // Data for steps taken on each day

  String timePeriod = "Aug 14";
  String daytimePeriod = "Aug 14";
  String weektimePeriod = "Aug 12 - Aug 14";
  String monthtimePeriod = "Aug 01 - Aug 14";
  String yeartimePeriod = "Jan 01 - Aug 14";

  double verticaldistance = 12; // Total distance covered
  double dayverticaldistance = 12;
  double weekverticaldistance = 28;
  double monthverticaldistance = 36;
  double yeartimeverticaldistance = 34;

  int stairCount = 567;
  int daystairCount = 567;
  int weekstairCount = 624;
  int monthstairCount = 670;
  int yeartimestairCount = 584;


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
  int weekimprovement = 14;
  int monthimprovement = 20;
  int yearimprovement = 15;

  List<int> daystairs = [
    0,
    0,
    0,
    0,
    0,
    0,
    14,
    12,
    0,
    0,
    1,
    10,
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
    0,
    0,
    14,
    12,
    0,
    0,
    12,
    10,
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
  List<int> weekstairs = [24, 28, 38, 0, 0, 0, 0];
  List<int> monthstairs = [
    34,
    26,
    20,
    18,
    42,
    12,
    18,
    32,
    20,
    16,
    10,
    24,
    28,
    38,
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
  List<int> yearstairs = [
    20,
    18,
    42,
    12,
    18,
    32,
    20,
    16,
    0,
    0,
    0,
    0,
  ];
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
    stairCount++;
    calorieCount++;
    improvement--;
    switch (selectedFilter) {
      case 'D':
        steps = daystairs;
        stairCount = daystairCount;
        calorieCount = daycalorieCount;
        improvement = dayimprovement;
        duration = dayduration;
        verticaldistance = dayverticaldistance;
        timePeriod = daytimePeriod;
        break;
      case 'W':
        steps = weekstairs;
        stairCount = weekstairCount;
        calorieCount = weekcalorieCount;
        improvement = weekimprovement;
        duration = weekduration;
        verticaldistance = weekverticaldistance;
        timePeriod = weektimePeriod;
        break;
      case 'M':
        steps = monthstairs;
        stairCount = monthstairCount;
        calorieCount = monthcalorieCount;
        improvement = monthimprovement;
        duration = monthduration;
        verticaldistance = monthverticaldistance;
        timePeriod = monthtimePeriod;
        break;
      case 'Y':
        steps = yearstairs;
        stairCount = yeartimestairCount;
        calorieCount = yearcalorieCount;
        improvement = yearimprovement;
        duration = yearduration;
        verticaldistance = yeartimeverticaldistance;
        timePeriod = yeartimePeriod;
        break;
    }
    // steps[5]--;
    // After updating the state, notify listeners to rebuild widgets that depend on this provider.
    notifyListeners();
  }
}
