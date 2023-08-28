import 'package:ayura/constants/colors.dart';
// import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:ayura/pages/features/activity_tracking/cycling_page.dart';
import 'package:ayura/pages/features/activity_tracking/sports_page.dart';
import 'package:ayura/pages/features/activity_tracking/stairs_page.dart';
import 'package:ayura/pages/features/activity_tracking/walking_and_running_page.dart';
import 'package:ayura/pages/features/activity_tracking/workouts_page.dart';
import 'package:ayura/provider/activityProviders/googleAuthProvider.dart';
import 'package:ayura/widgets/features/activity_tracking/activity_type.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Activities extends StatelessWidget {
  const Activities({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Define your named routes here
      debugShowCheckedModeBanner: false,
      routes: {
        '/activities': (context) =>  ActivitiesPage(),
        '/walkingandrunning': (context) => const WalkingAndRunningPage(),
        '/cycling': (context) => const CyclingPage(),
        '/stairs': (context) => const StairsPage(),
        '/sports': (context) => SportsPage(),
        '/workouts': (context) =>  WorkoutsPage(),
        // Add more named routes as needed
      },
      // Optionally, you can provide the initialRoute
      // if you want to start your app on a specific page.
      initialRoute:
          '/activities', // Uncomment and set the initial route if needed.
    );
  }
}

class ActivitiesPage extends StatefulWidget {

  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
        Size.fromHeight(90.0),
        child: CustomAppBar(
          appbarTitle: 'Activity',
          isBackBtn: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Consumer<GoogleAuthProvider>(
                  builder: (context, googleAuthProvider, _) {
                    return Switch(
                      value: googleAuthProvider.isUserAuthorized,
                      onChanged: (bool togglebtn){
                        googleAuthProvider.toggleGoogleAuthorization(togglebtn);
                      },
                    );
                  }
                ),
              ],
            ),
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
              route: '/cycling',
            ),
            CustomBoxItem(
              index: 3,
              imagePath: 'assets/images/activity_tracking/stairs.svg',
              mainText: 'Stairs',
              subText: 'Climb higher, conquer your limits.',
              route: '/stairs',
            ),
            CustomBoxItem(
              index: 4,
              imagePath: 'assets/images/activity_tracking/sports.svg',
              mainText: 'Sports',
              subText: 'Unleash your passion, embrace the challenge.',
              route: '/sports',
            ),
            CustomBoxItem(
              index: 5,
              imagePath: 'assets/images/activity_tracking/workout.svg',
              mainText: 'Workout',
              subText: 'Sweat, push, and transform your body and mind.',
              route: '/workouts',
            ),
            // Add more widgets here for the scrollable body
          ],
        ),
      ),
      bottomNavigationBar: AppNavigation(),
    );
  }

  void _onTabTapped(int index) {
    // Add your logic here to handle the navigation
    print("Tapped index: $index");
  }
}
