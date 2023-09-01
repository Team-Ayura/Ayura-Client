class WalkAndRunDataModel {
  final String timePeriod;
  final double avgDistanceWalked;
  final int avgStepCount;
  final int avgMoveMinutes;
  final int avgCaloriesBurned;
  final int improvement;
  final List<int> steps;

  WalkAndRunDataModel({
    required this.timePeriod,
    required this.avgDistanceWalked,
    required this.avgStepCount,
    required this.avgMoveMinutes,
    required this.avgCaloriesBurned,
    required this.improvement,
    required this.steps,
  });
}
