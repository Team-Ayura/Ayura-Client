import 'package:flutter/foundation.dart';

enum AppTab { mood, activity, home, community, sleep }

class AppNavigationProvider extends ChangeNotifier {
  AppTab _selectedTab = AppTab.home;

  AppTab get selectedTab => _selectedTab;

  void updateTab(AppTab newTab) {
    _selectedTab = newTab;
    notifyListeners();
  }
}
