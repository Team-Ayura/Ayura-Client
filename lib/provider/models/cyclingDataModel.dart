import 'package:ayura/provider/models/CyclingTrip.dart';

class CyclingDataModel {
  final String timePeriod;
  final double avgDistanceCycled;
  final int avgDuration;
  final int avgCaloriesBurned;
  final int improvement;
  final List<int> distances;
  final List<CyclingTrip> cyclingTrips;

  CyclingDataModel({
    required this.timePeriod,
    required this.avgDistanceCycled,
    required this.avgDuration,
    required this.avgCaloriesBurned,
    required this.improvement,
    required this.distances,
    required this.cyclingTrips
  });
}