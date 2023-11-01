import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:ayura/constants/constants.dart';
import 'package:ayura/provider/models/walkAndRunDataModel.dart';
import 'package:http/http.dart' as http;
import 'package:ayura/provider/activityProviders/googleAuthProvider.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/sleepDatamodel.dart';

enum ChartFilterType {week,biweek ,month}

extension ChartFilterTypeExtension on ChartFilterType {
  String get label {
    return toString().split('.').last[0].toUpperCase() +
        toString().split('.').last.substring(1);
  }
}

class SleepProvider extends ChangeNotifier {

  // constants
  final String requestBaseUrl = AppUrls.baseUrl;
  String _resMessage = '';
  final GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider();

  // sleep provider state variables
  SleepDataModel? SleepData;
  SleepDataModel? SleepDataCurrentWeek;
  SleepDataModel? SleepDataCurrentBiWeek;
  SleepDataModel? SleepDataCurrentMonth;
  ChartFilterType selectedFilter = ChartFilterType.week; // Default filter is 'D' for Day
  // Map<String, int> stepsData = {}; // Data for steps taken on each day

  // getters
  // String get duration {
  //   int hours = SleepData?.avgMoveMinutes ?? 0 ~/ 60;
  //   int minutes = walkAndRunData?.avgMoveMinutes ?? 0 % 60;

  //   String formattedHours = hours.toString().padLeft(2, '0');
  //   String formattedMinutes = minutes.toString().padLeft(2, '0');

  //   return '$formattedHours:$formattedMinutes';
  // }
  String get timePeriod => SleepData?.timePeriod ?? "";
  double get avgSleepTime => SleepData?.avgSleepTime ?? 0;
  List<int> get sleepingHours => SleepData?.sleepingHours ?? [];
  List<String> get stepCount => SleepData?.sleepQualities ?? [];
  List<String> get improvement => SleepData?.sleepHistory ?? [];

  

  // List<int> daysteps = [
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   420,
  //   174,
  //   0,
  //   0,
  //   0,
  //   115,
  //   80,
  //   221,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  // ];
  
  // List<int> weeksteps = [4375, 3198, 1042, 0, 0, 0, 0];
  // List<int> monthsteps = [3287, 4345, 5032, 4098, 3590, 5045, 4211, 4756, 3800, 5265, 4422, 4375, 3198, 1042, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  // List<int> yearsteps = [4200, 5150, 3550, 4920, 4675, 3035, 5298, 4067, 0, 0, 0, 0];

  // Implement methods to fetch data from the server and update the provider state
  // For example: fetchWalkAndRunningData, updateStepsData, etc.

  void initSleepProviderState() async {
    
    SleepDataCurrentWeek ??= await fetchSleepDataBackEnd(ChartFilterType.week);
    SleepDataCurrentBiWeek ??= await fetchSleepDataBackEnd(ChartFilterType.biweek);
    SleepDataCurrentMonth ??= await fetchSleepDataBackEnd(ChartFilterType.month);
   
    selectedFilter = ChartFilterType.week;

    notifyListeners();
  }

  void updateFilter(ChartFilterType filter) async {
    selectedFilter = filter;
    switch (selectedFilter) {
      case ChartFilterType.week:
        SleepDataCurrentWeek ??= await fetchSleepDataBackEnd(filter);
        SleepData = SleepDataCurrentWeek;
        break;
      case ChartFilterType.biweek:
        SleepDataCurrentBiWeek ??= await fetchSleepDataBackEnd(filter);
        SleepData = SleepDataCurrentBiWeek;
        break;
      case ChartFilterType.month:
        SleepDataCurrentMonth ??= await fetchSleepDataBackEnd(filter);
        SleepData = SleepDataCurrentMonth;
        break;
    }
    print(SleepData);
    // After updating the state, notify listeners to rebuild widgets that depend on this provider.
    notifyListeners();
  }

  // retrieve sleep data from back end.
  Future<SleepDataModel?> fetchSleepDataBackEnd(ChartFilterType type) async {

    // prepare the request arguments
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString('userId');
    final filterType = type.label;

    // backend api endpoint
    String url = '$requestBaseUrl/api/sleep/getsleepingdatabyfilter?userId=$userId&filterType=$filterType';
    
    // initialize the result object
    SleepDataModel? result;


    // post request and get response
    try {
      http.Response req = await http.get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization' : 'Bearer ${prefs.getString('jwtToken')}'
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

  
}    
   

 
List<int> generateIntArray(int size) {
  List<int> result = [];

  for (int i = 0; i < size; i++) {
    result.add(i);
  }

  return result;
}

