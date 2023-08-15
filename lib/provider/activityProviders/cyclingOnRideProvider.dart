import 'dart:async';

import 'package:flutter/foundation.dart';

class CyclingOnRideProvider extends ChangeNotifier {
  final List<String> _imagePaths = [];
  List<String> get imagePaths => _imagePaths;
  final int _calorieCounter = 0;
  final double _cyclingSpeed = 0.0;
  String imagePath(int index) => _imagePaths[index];
  int get calorieCounter => _calorieCounter;
  double get cyclingSpeed => _cyclingSpeed;
  Timer? _timer;
  int _secondsElapsed = 0;
  bool _isPaused = false;

  int get secondsElapsed => _secondsElapsed;
  bool get isPaused => _isPaused;

  void addImagePath(String imagePath) {
    _imagePaths.add(imagePath);
    notifyListeners();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        _secondsElapsed++;
        notifyListeners();
      }
    });
  }

  void startCycling() {
    if (_timer == null) {
      startTimer();
    }
    _isPaused = false;
    notifyListeners();
  }

  void pauseCycling() {
    _isPaused = true;
    notifyListeners();
  }

  void resumeCycling() {
    _isPaused = false;
    notifyListeners();
  }

  void resetCycling() {
    _isPaused = false;
    _secondsElapsed = 0;
    _timer?.cancel();
    _timer = null;
    _imagePaths.clear();
    notifyListeners();
  }

  void stopCycling() {
    resetCycling();
    notifyListeners();
  }

  String getFormattedTime() {
    int hours = _secondsElapsed ~/ 3600;
    int minutes = (_secondsElapsed % 3600) ~/ 60;
    int seconds = _secondsElapsed % 60;

    String hoursStr = hours.toString().padLeft(2, '0');
    String minutesStr = minutes.toString().padLeft(2, '0');
    String secondsStr = seconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }
}
