import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/activity_tracking/walking_and_running_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../widgets/features/activity_tracking/activity_type.dart';
import '../../../widgets/global/custom_app_bar.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define your named routes here
      debugShowCheckedModeBanner: false,
      routes: {
        '/activities': (context) => ActivitiesPage(),
        '/walkingandrunning': (context) => WalkingAndRunningPage(),
        '/cycling': (context) => CyclingPage(),
        '/stairs': (context) => StairsPage(),
        '/sports': (context) => SportsPage(),
        '/workouts': (context) => WorkoutsPage(),
        // Add more named routes as needed
      },
      // Optionally, you can provide the initialRoute
      // if you want to start your app on a specific page.
      initialRoute:
          '/activities', // Uncomment and set the initial route if needed.
    );
  }
}

class RunningPage extends StatelessWidget {
  RunningPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class CyclingPage extends StatelessWidget {
  CyclingPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class StairsPage extends StatelessWidget {
  StairsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class SportsPage extends StatelessWidget {
  SportsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class WorkoutsPage extends StatelessWidget {
  WorkoutsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

class ActivitiesPage extends StatelessWidget {
  ActivitiesPage({Key? key}) : super(key: key);

  final List<String> _iconAssets = [
    'assets/icons/bottomnav/mood.svg',
    'assets/icons/bottomnav/activity.svg',
    'assets/icons/bottomnav/home.svg',
    'assets/icons/bottomnav/community.svg',
    'assets/icons/bottomnav/meal.svg',
    // Add other SVG asset paths for other navigation items
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Activity')),
        backgroundColor: AppColors.primaryColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomBoxItem(
              index: 1,
              imagePath: 'assets/images/activity_tracking/running.svg',
              mainText: 'Walking & Running',
              subText: 'Step by step, you\'re closer to your goals',
              route: '/walkingandrunning',
            ),
            CustomBoxItem(
              index: 2,
              imagePath: 'assets/images/activity_tracking/cycling.svg',
              mainText: 'Cycling',
              subText: 'Pedal your way to strength and freedom.',
              route: '/walkingandrunning',
            ),
            CustomBoxItem(
              index: 3,
              imagePath: 'assets/images/activity_tracking/stairs.svg',
              mainText: 'Stairs',
              subText: 'Climb higher, conquer your limits.',
              route: '/walkingandrunning',
            ),
            CustomBoxItem(
              index: 4,
              imagePath: 'assets/images/activity_tracking/sports.svg',
              mainText: 'Sports',
              subText: 'Unleash your passion, embrace the challenge.',
              route: '/walkingandrunning',
            ),
            CustomBoxItem(
              index: 5,
              imagePath: 'assets/images/activity_tracking/workout.svg',
              mainText: 'Workout',
              subText: 'Sweat, push, and transform your body and mind.',
              route: '/walkingandrunning',
            ),
            // Add more widgets here for the scrollable body
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false, // Hide labels for selected items
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: _buildSvgIcon(0),
            label: 'Mood',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(1),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(2),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(3),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: _buildSvgIcon(4),
            label: 'Meal',
          ),
          // Add other navigation items here
        ],
      ),
    );
  }

  Widget _buildSvgIcon(int index) {
    Color iconColor = 1 == index ? Colors.blue : Colors.black;
    return SvgPicture.asset(
      _iconAssets[index],
      color: iconColor,
      height: 24,
      width: 24,
    );
  }

  void _onTabTapped(int index) {
    // Add your logic here to handle the navigation
    print("Tapped index: $index");
  }
}
