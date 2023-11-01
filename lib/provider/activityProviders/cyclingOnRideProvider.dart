import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class CyclingOnRideProvider extends ChangeNotifier {
  final List<String> _imagePaths = [];
  List<String> get imagePaths => _imagePaths;
  final int _calorieCounter = 0;
  double _cyclingSpeed = 0.0;
  String imagePath(int index) => _imagePaths[index];
  int get calorieCounter => _calorieCounter;
  double get cyclingSpeed => _cyclingSpeed;
  List<Position> _locationPoints = [];
  Position? _currentLocation;
  Position? get currentLocation => _currentLocation;
  double _totalDistance = 0;
  Timer? _timer;
  int _secondsElapsed = 0;
  bool _isPaused = false;

  int get secondsElapsed => _secondsElapsed;
  bool get isPaused => _isPaused;

  void addImagePath(String imagePath) {
    _imagePaths.add(imagePath);
    // print(_imagePaths);
    notifyListeners();
    print(imagePaths[0]);
    print("now");
  }

  Future<Position?> getCurrentLocation() async {
    PermissionStatus status = await Permission.location.request();
    if (status.isGranted) {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        _currentLocation = position;
        print(position);
        return position;
      } catch (e) {
        print("Error getting location: $e");
        return null;
      }
    }
    return null;
  }

  void _calculateDistanceAndSpeed() {
    for (int i = 1; i < _locationPoints.length; i++) {
      double distance = Geolocator.distanceBetween(
        _locationPoints[i - 1].latitude,
        _locationPoints[i - 1].longitude,
        _locationPoints[i].latitude,
        _locationPoints[i].longitude,
      );
      _totalDistance += distance;
    }
    // Calculate speed in km/h
    _cyclingSpeed = _totalDistance / (_secondsElapsed / 3600);
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!_isPaused) {
        _secondsElapsed++;
        if (_secondsElapsed % 30 == 0) {
          // Get the current location
          getCurrentLocation().then((position) {
            _locationPoints.add(position!);
            if (_locationPoints.length > 1) {
              // Calculate distance and speed
              _calculateDistanceAndSpeed();
            }
          });
        }
        notifyListeners();
      }
    });
  }

  void startCycling() {
    if (_timer == null) {
      startTimer();
    }
    _isPaused = false;
    _imagePaths.clear();
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
    // _imagePaths.clear();
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
