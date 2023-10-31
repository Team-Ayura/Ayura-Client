import 'package:ayura/provider/models/LocationPoint.dart';

class CyclingTrip {
  final String id;
  final DateTime startTime;
  final DateTime endTime;
  final double distance;
  final int duration;
  final int caloriesBurned;
  final List<LocationPoint> path;
  final List<String> images;

  CyclingTrip({
    required this.id,
    required this.startTime,
    required this.endTime,
    required this.distance,
    required this.duration,
    required this.caloriesBurned,
    required this.path,
    required this.images
  });
}