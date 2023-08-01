import 'package:flutter/foundation.dart';

class WalkingAndRunningProvider extends ChangeNotifier {
  String selectedFilter = 'D'; // Default filter is 'D' for Day
  Map<String, int> stepsData = {}; // Data for steps taken on each day
  double verticaldistance = 189; // Total distance covered
  int stairCount = 567;
  String duration = '01:23:45';
  int calorieCount = 1456;
  int improvement = 12;
  List<int> daystairs = [
    5,
    7,
    5,
    8,
    9,
    12,
    7,
    3,
    2,
    6,
    1,
    10,
    4,
    11,
    6,
    8,
    2,
    5,
    9,
    12,
    4,
    7,
    3,
    1,
    11,
  ];
  List<int> steps = [
    5,
    7,
    5,
    8,
    9,
    12,
    7,
    3,
    2,
    6,
    1,
    10,
    4,
    11,
    6,
    8,
    2,
    5,
    9,
    12,
    4,
    7,
    3,
    1,
    11,
  ];
  List<int> weekstairs = [5, 7, 5, 8, 9, 12, 7];
  List<int> monthstairs = [
    5,
    7,
    5,
    8,
    9,
    12,
    7,
    3,
    2,
    6,
    1,
    10,
    4,
    11,
    6,
    8,
    2,
    5,
    9,
    12,
    4,
    7,
    3,
    1,
    11,
    10,
    6,
    9,
    5,
    8,
    2
  ];
  List<int> yearstairs = [5, 7, 5, 8, 9, 12, 7, 5, 8, 9, 12, 2];
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
        break;
      case 'W':
        steps = weekstairs;
        break;
      case 'M':
        steps = monthstairs;
        break;
      case 'Y':
        steps = yearstairs;
        break;
    }
    // steps[5]--;
    // After updating the state, notify listeners to rebuild widgets that depend on this provider.
    notifyListeners();
  }
}
