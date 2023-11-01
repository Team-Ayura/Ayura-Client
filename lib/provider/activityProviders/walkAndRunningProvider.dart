import 'dart:convert';
import 'dart:io';
import 'package:ayura/constants/constants.dart';
import 'package:ayura/constants/enums.dart';
import 'package:ayura/provider/models/walkAndRunDataModel.dart';
import 'package:http/http.dart' as http;
// import 'package:ayura/provider/activityProviders/googleAuthProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ChartFilterType {day, week, month, year}

extension ChartFilterTypeExtension on ChartFilterType {
  String get label {
    return toString().split('.').last[0].toUpperCase() +
        toString().split('.').last.substring(1);
  }
}

class WalkingAndRunningProvider extends ChangeNotifier {

  // constants
  final String requestBaseUrl = AppUrls.baseUrl;
  String _resMessage = '';
  // final GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();

  // walk and running provider state variables
  WalkAndRunDataModel? walkAndRunData;
  WalkAndRunDataModel? walkAndRunDataToday;
  WalkAndRunDataModel? walkAndRunDataCurrentWeek;
  WalkAndRunDataModel? walkAndRunDataCurrentMonth;
  WalkAndRunDataModel? walkAndRunDataCurrentYear;
  ChartFilterType selectedFilter = ChartFilterType.day; // Default filter is 'D' for Day
  // Map<String, int> stepsData = {}; // Data for steps taken on each day

  // getters
  String get duration {
    int avgMoveMinutes = walkAndRunData?.avgMoveMinutes ?? 0;
    int hours = avgMoveMinutes ~/ 60;
    int minutes = avgMoveMinutes % 60;

    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = minutes.toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes';
  }
  String get timePeriod => walkAndRunData?.timePeriod ?? "";
  double get distance => walkAndRunData?.avgDistanceWalked ?? 0;
  int get calorieCount => walkAndRunData?.avgCaloriesBurned ?? 0;
  int get stepCount => walkAndRunData?.avgStepCount ?? 0;
  int get improvement => walkAndRunData?.improvement ?? 0;
  List<int> get steps => walkAndRunData?.steps ?? [];

  void initWalkAndRunningProviderState() async {
    walkAndRunDataToday = await fetchWalkAndRunDataGoogleFit(ChartFilterType.week);
    walkAndRunDataCurrentWeek ??= await fetchWalkAndRunDataBackEnd(ChartFilterType.week);
    walkAndRunDataCurrentMonth ??= await fetchWalkAndRunDataBackEnd(ChartFilterType.month);
    walkAndRunDataCurrentYear ??= await fetchWalkAndRunDataBackEnd(ChartFilterType.year);
    selectedFilter = ChartFilterType.day;
    walkAndRunData = walkAndRunDataToday;
    notifyListeners();
  }

  void updateFilter(ChartFilterType filter) async {
    selectedFilter = filter;
    switch (selectedFilter) {
      case ChartFilterType.day:
        // walkAndRunDataToday ??= await fetchWalkAndRunDataGoogleFit(filter);
        walkAndRunData = walkAndRunDataToday;
        break;
      case ChartFilterType.week:
        // walkAndRunDataCurrentWeek ??= await fetchWalkAndRunDataBackEnd(filter);
        walkAndRunData = walkAndRunDataCurrentWeek;
        break;
      case ChartFilterType.month:
        // walkAndRunDataCurrentMonth ??= await fetchWalkAndRunDataBackEnd(filter);
        walkAndRunData = walkAndRunDataCurrentMonth;
        break;
      case ChartFilterType.year:
        // walkAndRunDataCurrentYear ??= await fetchWalkAndRunDataBackEnd(filter);
        walkAndRunData = walkAndRunDataCurrentYear;
        break;
    }
    // After updating the state, notify listeners to rebuild widgets that depend on this provider.
    notifyListeners();
  }

  // retrieve walk and running data from back end.
  Future<WalkAndRunDataModel?> fetchWalkAndRunDataBackEnd(ChartFilterType type) async {

    // prepare the request arguments
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(BasicUserData.userId.label);
    final filterType = type.label;
    // print(prefs.getString(BasicUserData.googleAccessToken.label));
    // backend api endpoint
    String url = '$requestBaseUrl/api/activity/getwalkandrundatabyfilter?userId=$userId&filterType=$filterType';

    // initialize the result object
    WalkAndRunDataModel? result;

    // post request and get response
    try {
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ${prefs.getString(BasicUserData.token.label)}'
        },
      );


      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        final resbody = res["data"];
        print(resbody);

        result = WalkAndRunDataModel(
          timePeriod: resbody["timePeriod"],
          avgDistanceWalked: resbody["avgDistanceWalked"],
          avgStepCount: resbody["avgStepCount"],
          avgMoveMinutes: resbody["avgMoveMinutes"],
          avgCaloriesBurned: resbody["avgCaloriesBurned"],
          improvement: resbody["improvement"],
          steps: List<int>.from(resbody["steps"]),
        );

        _resMessage = "Fetched Successfully!";
      } else {
        final res = json.decode(req.body);
        _resMessage = res['message'];

      }
    } on SocketException catch (e) {
      _resMessage = e.toString();
    } catch (e) {
      _resMessage = e.toString();
    }

    return result;
  }

  Future<int> fetchTodayStepCountImprovement(int stepCount) async {

    // prepare the request arguments
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(BasicUserData.userId.label);

    // backend api endpoint
    String url = '$requestBaseUrl/api/activity/getwalkandrundatabyfilter?userId=$userId&todayStepCount=$stepCount';

    // initialize the result object
    int result = 0;

    // post request and get response
    try {
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ${prefs.getString(BasicUserData.token.label)}'
        },
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);
        result = res["data"];
        _resMessage = "Fetched Successfully!";
      } else {
        final res = json.decode(req.body);
        _resMessage = res['message'];
      }
    } on SocketException catch (e) {
      _resMessage = e.toString();
    } catch (e) {
      _resMessage = e.toString();
    }

    return result;
  }

  // retrieve step count from google fit API
  Future<WalkAndRunDataModel?> fetchWalkAndRunDataGoogleFit(ChartFilterType type) async {

    // seting local variables
    int stepCount = 0;
    double distanceWalked = 0;
    int caloriesBurned = 0;
    int moveMinutes = 0;
    int improvement = 0;

    // Get the current date and time
    DateTime now = DateTime.now();
    int nowMillis = now.millisecondsSinceEpoch;

    // Start time of today (00:00 AM)
    DateTime startOfToday = DateTime(now.year, now.month, now.day);
    int startOfTodayMillis = startOfToday.millisecondsSinceEpoch;

    // get step count, calories burned, distance walked and movement minutes
    Map<String, dynamic>? stepsDistanceCaloriesMoveMinutesMap = await fetchOtherSingularDataGoogleFit(type, 86400000, startOfTodayMillis, nowMillis);
    if(stepsDistanceCaloriesMoveMinutesMap != null) {
      stepCount = stepsDistanceCaloriesMoveMinutesMap["stepCount"];

      distanceWalked = stepsDistanceCaloriesMoveMinutesMap["distanceWalked"];
      distanceWalked = distanceWalked/100; // convert to Km

      caloriesBurned = stepsDistanceCaloriesMoveMinutesMap["caloriesBurned"];

      moveMinutes = stepsDistanceCaloriesMoveMinutesMap["moveMinutes"];

      improvement = stepsDistanceCaloriesMoveMinutesMap["improvement"];
    }
    // print(stepsDistanceCaloriesMoveMinutesMap);
    // steps array in each hour
    List<int> steps = await fetchStepCountGoogleFit(type, 3600000, startOfTodayMillis, nowMillis);

    // initialize the result object
    WalkAndRunDataModel result = WalkAndRunDataModel(
      timePeriod: DateFormat.MMMd().format(now),
      avgStepCount: stepCount,
      avgDistanceWalked: distanceWalked,
      avgCaloriesBurned: caloriesBurned,
      avgMoveMinutes: moveMinutes,
      improvement: improvement,
      steps: steps,
    );
    return result;
  }

  Future<List<int>> fetchStepCountGoogleFit(ChartFilterType type, int bucketTime, int startMillis, int endMillis) async {
    // prepare url endpoint
    final url = Uri.parse('https://fitness.googleapis.com/fitness/v1/users/me/dataset:aggregate');

    // initializing the result variable
    // 24 because 24 hours per day
    List<int> result = generateIntArray(24);

    // get google account access token
    // String? token = await _googleAuthProvider.getAccessToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(BasicUserData.googleAccessToken.label);
    // print(token);
    // generate the request headers
    final headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    // generate the request body
    final requestBody = {
      "aggregateBy": [
        {
          "dataTypeName": "com.google.step_count.delta"
        }
      ],
      "bucketByTime": {"durationMillis": bucketTime},
      "startTimeMillis": startMillis,
      "endTimeMillis": endMillis,
    };

    // marshalling -> sending -> receiving -> unmarshalling the data
    final response = await http.post(url, headers: headers, body: jsonEncode(requestBody));
    int index = 0;
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      for (var bucket in data['bucket']) {
        for (var dataset in bucket['dataset']) {
          for (var point in dataset['point']) {
            for (var value in point['value']) {
              if(index < result.length) {
                result[index] = value['intVal'];
                index++;
              }
            }
          }
        }
      }
    }
    // print(result);
    return result;
  }

  Future<Map<String, dynamic>?> fetchOtherSingularDataGoogleFit(ChartFilterType type, int bucketTime, int startMillis, int endMillis) async {
    // prepare url endpoint
    final url = Uri.parse('https://fitness.googleapis.com/fitness/v1/users/me/dataset:aggregate');
    // print(startMillis);
    // print(endMillis);
    // initializing the result variable
    // 24 because 24 hours per day
    Map<String, dynamic>? result;

    // get google account access token
    // String? token = await _googleAuthProvider.getAccessToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(BasicUserData.googleAccessToken.label);
    // print(token);

    // generate the request headers
    final headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };

    // generate the request body
    final requestBody = {
      "aggregateBy": [
        {
          "dataTypeName": "com.google.step_count.delta"
        },
        {
          "dataTypeName": "com.google.distance.delta"
        },
        {
          "dataTypeName": "com.google.active_minutes"
        },
        {
          "dataTypeName": "com.google.calories.expended"
        }

      ],
      "bucketByTime": {"durationMillis": bucketTime},
      "startTimeMillis": startMillis,
      "endTimeMillis": endMillis,
    };

    // marshalling -> sending -> receiving -> unmarshalling the data
    final response = await http.post(url, headers: headers, body: jsonEncode(requestBody));
    // int index = 0;
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // print(data);
      final List<dynamic> bucket = data['bucket'] ?? [];
      // print(bucket);
      if (bucket.isNotEmpty) {
        final Map<String, dynamic> dataset = bucket[0]['dataset'][0];
        // print(dataset);
        int stepCount=0;
        if(dataset['point'].length > 0){
          // print(dataset['point']);
          stepCount = dataset['point'][0]['value'][0]['intVal'];
        }

        final Map<String, dynamic> distanceDataset = bucket[0]['dataset'][1];
        // print(distanceDataset);
        double distanceWalked=0.0;
        if(dataset['point'].length > 0){
          distanceWalked = distanceDataset['point'][0]['value'][0]['fpVal'];
        }

        final Map<String, dynamic> caloriesDataset = bucket[0]['dataset'][3];
        int caloriesBurned = 0;
        if(dataset['point'].length > 0){
          caloriesBurned = caloriesDataset['point'][0]['value'][0]['fpVal'];
        }

        final Map<String, dynamic> moveMinutesDataset = bucket[0]['dataset'][2];
        int moveMinutes = 0;
        if(dataset['point'].length > 0){
          moveMinutes = moveMinutesDataset['point'][0]['value'][0]['intVal'];
        }

        result = {
          'stepCount': stepCount,
          'distanceWalked': distanceWalked,
          'caloriesBurned': caloriesBurned,
          'moveMinutes': moveMinutes,
          'improvement': await fetchTodayStepCountImprovement(stepCount)
        };
      }
    }
    // print(result);
    return result;
  }
}

List<int> generateIntArray(int size) {
  List<int> result = [];

  for (int i = 0; i < size; i++) {
    result.add(0);
  }

  return result;
}