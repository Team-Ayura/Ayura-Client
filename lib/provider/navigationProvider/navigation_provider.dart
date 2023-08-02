import 'package:flutter/foundation.dart';

enum AppTab { vitals, activity, home, community, mealplans }

class AppNavigationProvider extends ChangeNotifier {
  AppTab _selectedTab = AppTab.home;

  AppTab get selectedTab => _selectedTab;

  void updateTab(AppTab newTab) {
    _selectedTab = newTab;
    notifyListeners();
  }
}
