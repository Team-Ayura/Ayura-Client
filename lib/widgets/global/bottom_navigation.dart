import 'package:ayura/constants/colors.dart';
import 'package:ayura/provider/navigationProvider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import 'navigation_provider/navigation_provider.dart'; // Update the import to your actual file path

class AppNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AppNavigationProvider appNavigationProvider =
        Provider.of<AppNavigationProvider>(context);

    return BottomNavigationBar(
      currentIndex: AppTab.values.indexOf(appNavigationProvider.selectedTab),
      onTap: (index) {
        appNavigationProvider.updateTab(AppTab.values[index]);
      },
      items: [
        _buildNavigationItem('vitals', 'Vitals', AppTab.vitals),
        _buildNavigationItem('activity', 'Activity', AppTab.activity),
        _buildNavigationItem('home', 'Home', AppTab.home),
        _buildNavigationItem('community', 'Community', AppTab.community),
        _buildNavigationItem('mealplans', 'Meal Plans', AppTab.mealplans),
      ],
    );
  }

  BottomNavigationBarItem _buildNavigationItem(
      String iconName, String label, AppTab tab) {
    return BottomNavigationBarItem(
      icon: Consumer<AppNavigationProvider>(
          builder: (context, appNavigationProvider, _) {
        bool isActive = appNavigationProvider.selectedTab == tab;
        return SvgPicture.asset(
          'asset/icons/navigation/$iconName.svg',
          width: 24,
          height: 24,
          color: isActive
              ? AppColors.primaryColor
              : AppColors.textColor, // Update active and inactive colors here
        );
      }),
      label: label,
    );
  }
}
