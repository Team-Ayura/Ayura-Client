import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/Diary/diary.dart';
import 'package:ayura/pages/features/Diary/diary_list.dart';
import 'package:ayura/pages/features/activity_tracking/activity.dart';
import 'package:ayura/provider/navigationProvider/navigation_provider.dart';
import 'package:ayura/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ayura/pages/features/community/community_home.dart';
import 'package:ayura/pages/features/mealPlan/meal_screen.dart';
import 'package:ayura/pages/home.dart';

import 'package:provider/provider.dart';
// import 'navigation_provider/navigation_provider.dart'; // Update the import to your actual file path

class AppNavigation extends StatelessWidget {
  const AppNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    AppNavigationProvider appNavigationProvider =
        Provider.of<AppNavigationProvider>(context);

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      currentIndex: AppTab.values.indexOf(appNavigationProvider.selectedTab),
      onTap: (index) {
        appNavigationProvider.updateTab(AppTab.values[index]);
        PageNavigator(context: context)
            .nextPage(_buildPageForTab(AppTab.values[index]));
      },
      items: [
        _buildNavigationItem('vitals', 'diary', AppTab.diary),
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
        backgroundColor: Colors.white,
        icon: Consumer<AppNavigationProvider>(
            builder: (context, appNavigationProvider, _) {
          bool isActive = appNavigationProvider.selectedTab == tab;
          return ColorFiltered(
            colorFilter: ColorFilter.mode(
              isActive
                  ? AppColors.primaryColor
                  : AppColors.textColor, // Set the color of the SVG icon
              BlendMode.srcATop,
            ),
            child: SvgPicture.asset(
              'assets/icons/navigation/$iconName.svg',
              width: 24,
              height: 24,
            ),
          );
        }),
        label: "");
  }

  // edit this to navigate to your feature
  Widget _buildPageForTab(AppTab tab) {
    switch (tab) {
      case AppTab.diary:
        return const DiaryList(); // navigate to vitals page
      case AppTab.activity:
        return const Activities(); // navigate to activities page
      case AppTab.home:
        return const Home(); // navigate to home page
      case AppTab.community:
        return const CommunityHome(); // navigate to community page
      case AppTab.mealplans:
        return const MealScreen(); // navigate to mealplans page
      default:
        return const SizedBox.shrink();
    }
  }
}
