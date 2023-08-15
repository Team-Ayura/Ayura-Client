import 'dart:math';

import 'package:ayura/pages/features/activity_tracking/createNewWorkoutPage.dart';
import 'package:ayura/provider/models/sportModel.dart';
import 'package:ayura/widgets/features/activity_tracking/multi_selection_popup.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class WorkoutsProvider extends ChangeNotifier {
  List<ActivityItem> newWorkoutActivities = [];

  void addActivityToNewWorkout(Activity activity, int countPerSet, int numOfSets){
    ActivityItem item = ActivityItem(
      activityId: activity.activityId,
      activityName: activity.activityName,
      isTimeBased: activity.isTimeBased,
      caloriesPerHour: activity.caloriesPerHour,
      countPerSet: countPerSet,
      numOfSets: numOfSets,
    );
    newWorkoutActivities.add(item);
    notifyListeners();
  }
}

class ActivityItem{
  final String activityId;
  final String activityName;
  final bool isTimeBased;
  final double caloriesPerHour;
  final int countPerSet;
  final int numOfSets;

  ActivityItem({
    required this.activityId,
    required this.activityName,
    required this.isTimeBased,
    required this.caloriesPerHour,
    required this.countPerSet,
    required this.numOfSets,
  });
}
