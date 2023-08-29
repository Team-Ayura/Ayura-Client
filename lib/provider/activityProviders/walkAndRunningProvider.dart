import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ayura/provider/activityProviders/googleAuthProvider.dart';
import 'package:flutter/foundation.dart';

enum StepBucketType {hourly, daily, weekly, monthly}

class WalkingAndRunningProvider extends ChangeNotifier {
  // final GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();

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

  int stepCount = 824;
  int daystepCount = 824;
  int weekstepcount = 755;
  int monthstepcount = 766;
  int yearstepcount = 734;

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

  // this works now think how to manage the accesstoken seamlessly
  Future<void> fetchStepsData() async {
    // steps today
    steps = await getStepCounts(StepBucketType.hourly, 864000000, 1691830747677, 1693040311298);
    // steps this week

    // steps this month

    // steps this year

  }

  Future<List<int>> getStepCounts(StepBucketType type, int bucketTime, int startMillis, int endMillis) async {
    final url = Uri.parse('https://fitness.googleapis.com/fitness/v1/users/me/dataset:aggregate');
    List<int> result = [];
    final headers = {
      'Content-type': 'application/json',
      // 'Authorization': 'Bearer ${_googleAuthProvider.getAccessToken()}',
    };

    // Rest of your code remains the same...
    final requestBody = {
      "aggregateBy": [
        {"dataSourceId": "derived:com.google.step_count.delta:com.google.android.gms:estimated_steps"}
      ],
      "bucketByTime": {"durationMillis": bucketTime},
      "startTimeMillis": startMillis,
      "endTimeMillis": endMillis,
    };

    final response = await http.post(url, headers: headers, body: jsonEncode(requestBody));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      for (var bucket in data['bucket']) {
        for (var dataset in bucket['dataset']) {
          for (var point in dataset['point']) {
            for (var value in point['value']) {
              result.add(value['intVal']);
            }
          }
        }
      }
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
    print(result);
    if(result.isEmpty){
      int listsize = type == StepBucketType.hourly ? 24 : type == StepBucketType.hourly ? 7 : type == StepBucketType.hourly ? 30 : 12;
      return generateIntArray(listsize);
    }else{
      return result;
    }
  }
}

List<int> generateIntArray(int size) {
  List<int> result = [];

  for (int i = 0; i < size; i++) {
    result.add(i);
  }

  return result;
}