import 'package:flutter/material.dart';

class SymptomsProvider extends ChangeNotifier {
  List<bool> checkboxValues = List.generate(8, (index) => false);
  int selectedCheckboxIndex = -1;

  void toggleCheckbox(int index) {
    checkboxValues[index] = !checkboxValues[index];
    selectedCheckboxIndex = checkboxValues[index] ? index : -1;
    notifyListeners();
  }
}
