import 'package:flutter/foundation.dart';

class MoodProvider with ChangeNotifier {
  int _selectedCount = 0;
  int get selectedCount => _selectedCount;

  String _selectedMood = '';
  String get selectedMood => _selectedMood;

  DateTime? _selectedDateTime; // Add this property
  DateTime? get selectedDateTime => _selectedDateTime;

  void selectMood(String mood, [DateTime? dateTime]) {
    if (_selectedMood == mood) return;

    if (_selectedMood.isNotEmpty) {
      _selectedCount--;
    }

    _selectedMood = mood;
   _selectedDateTime = dateTime ?? DateTime.now(); 
    _selectedCount++;
    notifyListeners();
  }
}
