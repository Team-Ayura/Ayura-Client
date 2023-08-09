class SportModel {
  String id;
  String name;
  int caloriesPerHour;
  int averageDuration;
  List<SportHistory> sportHistory;

  SportModel({
    required this.id,
    required this.name,
    required this.caloriesPerHour,
    required this.averageDuration,
    required this.sportHistory,
  });

  factory SportModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> sportHistoryJson = json['sportHistory'] ?? [];
    List<SportHistory> sportHistoryList =
        sportHistoryJson.map((item) => SportHistory.fromJson(item)).toList();

    return SportModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      caloriesPerHour: json['calories_per_hour'] ?? 0,
      averageDuration: json['average_duration'] ?? 0,
      sportHistory: sportHistoryList,
    );
  }
}

class SportHistory {
  DateTime startDateTime;
  int duration;
  int caloriesBurned;
  String improvement;

  SportHistory({
    required this.startDateTime,
    required this.duration,
    required this.caloriesBurned,
    required this.improvement,
  });

  factory SportHistory.fromJson(Map<String, dynamic> json) {
    return SportHistory(
      startDateTime: DateTime.parse(json['start_date_time'] ?? ''),
      duration: json['duration'] ?? 0,
      caloriesBurned: json['calories_burned'] ?? 0,
      improvement: json['improvement'] ?? '',
    );
  }
}
