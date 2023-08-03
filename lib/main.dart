import 'package:ayura/auth/onboarding_screen.dart';
import 'package:ayura/pages/splash_screen.dart';
import 'package:ayura/auth/signup.dart';
import 'package:ayura/pages/home.dart';
import 'package:ayura/provider/activityProviders/stairsProvider.dart';
import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/provider/autProvider/auth_provider.dart';
import 'package:ayura/provider/functions/init.dart';
import 'package:ayura/provider/navigationProvider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isViewed;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = await prefs.getInt("isViewed");
  await prefs.setInt("isViewed", 1);
  runApp(MyApp());
}

// void main() {
//   runApp(MyApp());
// }

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Future _initFuture = Init.initialize();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider2()),
        ChangeNotifierProvider(create: (_) => AppNavigationProvider()),
        ChangeNotifierProvider(create: (_) => WalkingAndRunningProvider()),
        ChangeNotifierProvider(create: (_) => StairsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ayura',
        home: FutureBuilder(
          future: _initFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return isViewed != 0 ? OnboardingScreen() : Home();
            } else {
              return const SplashScreen();
            }
          },
        ),
      ),
    );
  }
}
