import 'dart:convert';
import 'dart:io';

import 'package:ayura/constants/constants.dart';
import 'package:ayura/constants/enums.dart';
import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/provider/models/CyclingTrip.dart';
import 'package:ayura/provider/models/LocationPoint.dart';
import 'package:ayura/provider/models/cyclingDataModel.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CyclingProvider extends ChangeNotifier {
  // walk and running provider state variables
  CyclingDataModel? cyclingData;
  CyclingDataModel? cyclingDataToday;
  CyclingDataModel? cyclingDataWeek;
  CyclingDataModel? cyclingDataMonth;
  CyclingDataModel? cyclingDataYear;
  final String requestBaseUrl = AppUrls.baseUrl;
  ChartFilterType selectedFilter = ChartFilterType.day;// Default filter is 'D' for Day
  Map<String, int> distanceData = {}; // Data for steps taken on each day

  // getters
  String get duration {
    int avgMoveMinutes = cyclingData?.avgDuration ?? 0;
    int hours = avgMoveMinutes ~/ 60;
    int minutes = avgMoveMinutes % 60;

    String formattedHours = hours.toString().padLeft(2, '0');
    String formattedMinutes = minutes.toString().padLeft(2, '0');

    return '$formattedHours:$formattedMinutes';
  }
  String get timePeriod => cyclingData?.timePeriod ?? "";
  double get distance => cyclingData?.avgDistanceCycled ?? 0;
  int get calorieCount => cyclingData?.avgCaloriesBurned ?? 0;
  int get improvement => cyclingData?.improvement ?? 0;
  List<int> get distances => cyclingData?.distances ?? [];

  // String timePeriod = "Aug 14";
  // String daytimePeriod = "Aug 14";
  // String weektimePeriod = "Aug 12 - Aug 14";
  // String monthtimePeriod = "Aug 01 - Aug 14";
  // String yeartimePeriod = "Jan 01 - Aug 14";
  //
  // double distance = 5.42; // Total distance covered
  // double daydistance = 5.42;
  // double weekdistance = 3.13;
  // double monthdistance = 3.20;
  // double yeardistance = 4.05;
  // // int stepCount = 1208;
  // String duration = '00:23:00';
  // String dayduration = '00:23:00';
  // String weekduration = '00:44:00';
  // String monthduration = '00:55:00';
  // String yearduration = '00:34:00';
  //
  // int calorieCount = 456;
  // int daycalorieCount = 456;
  // int weekcalorieCount = 703;
  // int monthcalorieCount = 1338;
  // int yearcalorieCount = 815;
  //
  // int improvement = 12;
  // int dayimprovement = 12;
  // int weekimprovement = 5;
  // int monthimprovement = 7;
  // int yearimprovement = 11;
  //
  // List<int> daydistances = [
  //   0,
  //   0,
  //   0,
  //   0,
  //   5,
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
  // List<int> distances = [
  //   0,
  //   0,
  //   0,
  //   0,
  //   5,
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
  // List<int> weekdistances = [5, 7, 5, 0, 0, 0, 0];
  // List<int> monthdistances = [
  //   5,
  //   7,
  //   5,
  //   8,
  //   9,
  //   12,
  //   7,
  //   11,
  //   2,
  //   6,
  //   1,
  //   5,
  //   7,
  //   5,
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
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  //   0,
  // ];
  // List<int> yeardistances = [5, 7, 5, 8, 9, 12, 7, 5, 0, 0, 0, 0];

  void initCyclingProviderState() async {
    cyclingDataToday = await fetchWalkAndRunDataBackEnd(ChartFilterType.day);
    cyclingDataWeek ??= await fetchWalkAndRunDataBackEnd(ChartFilterType.week);
    cyclingDataMonth ??= await fetchWalkAndRunDataBackEnd(ChartFilterType.month);
    cyclingDataYear ??= await fetchWalkAndRunDataBackEnd(ChartFilterType.year);
    selectedFilter = ChartFilterType.day;
    cyclingData = cyclingDataToday;
    print("check here");
    print(cyclingData);
    notifyListeners();
  }

  void updateFilter(ChartFilterType filter) async {
    selectedFilter = filter;
    switch (selectedFilter) {
      case ChartFilterType.day:
      // walkAndRunDataToday ??= await fetchWalkAndRunDataGoogleFit(filter);
        cyclingData = cyclingDataToday;
        break;
      case ChartFilterType.week:
      // walkAndRunDataCurrentWeek ??= await fetchWalkAndRunDataBackEnd(filter);
        cyclingData = cyclingDataWeek;
        break;
      case ChartFilterType.month:
      // walkAndRunDataCurrentMonth ??= await fetchWalkAndRunDataBackEnd(filter);
        cyclingData = cyclingDataMonth;
        break;
      case ChartFilterType.year:
      // walkAndRunDataCurrentYear ??= await fetchWalkAndRunDataBackEnd(filter);
        cyclingData = cyclingDataYear;
        break;
    }
    // After updating the state, notify listeners to rebuild widgets that depend on this provider.
    notifyListeners();
  }

  Future<CyclingDataModel?> fetchWalkAndRunDataBackEnd(ChartFilterType type) async {

    // prepare the request arguments
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(BasicUserData.userId.label);
    print(userId);
    final filterType = type.label;
    print(prefs.getString(BasicUserData.googleAccessToken.label));
    // backend api endpoint
    String url = '$requestBaseUrl/api/activity/getcyclingdatabyfilter?userId=$userId&filterType=$filterType';

    // initialize the result object
    CyclingDataModel? result;

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
        // print(List<int>.from(resbody["distances"]));
        // print(List<CyclingTrip>.from(resbody["cyclingHistory"].map((trip) {
        //   return CyclingTrip(
        //     id: trip["id"],
        //     startTime: DateTime.parse(trip["startTime"]),
        //     endTime: DateTime.parse(trip["endTime"]),
        //     distance: trip["distance"],
        //     duration: trip["duration"],
        //     caloriesBurned: trip["caloriesBurned"],
        //     path: List<LocationPoint>.from(trip["path"].map((point) {
        //       return LocationPoint(
        //         latitude: point["latitude"],
        //         longitude: point["longitude"],
        //       );
        //     })),
        //     images: List<String>.from(trip["images"] ?? []),
        //   );
        // })));
        result = CyclingDataModel(
          timePeriod: resbody["timePeriod"],
          avgDistanceCycled: resbody["avgDistanceCycled"],
          avgDuration: resbody["avgDuration"],
          avgCaloriesBurned: resbody["avgCaloriesBurned"],
          improvement: resbody["improvement"],
          distances: List<int>.from(resbody["distances"]),
          cyclingTrips: List<CyclingTrip>.from(resbody["cyclingHistory"].map((trip) {
            return CyclingTrip(
              id: trip["id"],
              startTime: DateTime.parse(trip["startTime"]),
              endTime: DateTime.parse(trip["endTime"]),
              distance: trip["distance"],
              duration: trip["duration"],
              caloriesBurned: trip["caloriesBurned"],
              path: List<LocationPoint>.from(trip["path"].map((point) {
                return LocationPoint(
                  latitude: point["latitude"],
                  longitude: point["longitude"],
                );
              })),
              images: List<String>.from(trip["images"] ?? []),
            );
          }))
        );

        // _resMessage = "Fetched Successfully!";
      } else {
        final res = json.decode(req.body);
        // _resMessage = res['message'];

      }
    } on SocketException catch (e) {
      // _resMessage = e.toString();
    } catch (e) {
      // _resMessage = e.toString();
    }
    print(result);
    return result;
  }

  // Implement methods to fetch data from the server and update the provider state
  // For example: fetchWalkAndRunningData, updateStepsData, etc.

  // void updateFilter(ChartFilterType filter) {
  //   selectedFilter = filter;
  //   // Fetch and update the stepsData and distance based on the selected filter
  //   // You should implement this logic based on how you fetch data from the server
  //   // and structure your data.
  //   // For example, if the selected filter is 'W' (Week), fetch weekly data and update the state.
  //   // Similarly for other filters.
  //
  //   // testing code to check if the provider is working
  //   // stepCount++;
  //   calorieCount++;
  //   improvement--;
  //   switch (selectedFilter) {
  //     case ChartFilterType.day:
  //       distances = daydistances;
  //       calorieCount = daycalorieCount;
  //       improvement = dayimprovement;
  //       duration = dayduration;
  //       timePeriod = daytimePeriod;
  //       distance = daydistance;
  //       break;
  //     case ChartFilterType.week:
  //       distances = weekdistances;
  //       calorieCount = weekcalorieCount;
  //       improvement = weekimprovement;
  //       duration = weekduration;
  //       timePeriod = weektimePeriod;
  //       distance = weekdistance;
  //       break;
  //     case ChartFilterType.month:
  //       distances = monthdistances;
  //       calorieCount = monthcalorieCount;
  //       improvement = monthimprovement;
  //       duration = monthduration;
  //       timePeriod = monthtimePeriod;
  //       distance = monthdistance;
  //       break;
  //     case ChartFilterType.year:
  //       distances = yeardistances;
  //       calorieCount = yearcalorieCount;
  //       improvement = yearimprovement;
  //       duration = yearduration;
  //       timePeriod = yeartimePeriod;
  //       distance = yeardistance;
  //       break;
  //   }
  //   // steps[5]--;
  //   // After updating the state, notify listeners to rebuild widgets that depend on this provider.
  //   notifyListeners();
  // }
}
