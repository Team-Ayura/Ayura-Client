import 'dart:collection';
import 'package:ayura/widgets/global/custom_appbar.dart';
import 'package:ayura/pages/features/mealPlan/meal_screen.dart';
import 'package:ayura/pages/features/mood_tracking/page1.dart';
import 'package:ayura/auth/login.dart';
import 'package:ayura/provider/autProvider/authentication_provider.dart';
import 'package:ayura/pages/features/mood_tracking/page1.dart';
import 'package:ayura/utils/convertDate.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/bottom_navigation.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ayura/constants/styles.dart';

import '../utils/router.dart';
import 'features/activity_tracking/activity.dart';
import 'package:provider/provider.dart';
import 'package:ayura/pages/features/community/community_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController birthdayController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0), // Set the preferred size here.
        child: CustomAppBar(
          appbarTitle: 'Home',
          onPressed: null,
        ),
      ),
      body: const Center(
        child: Column(
          children: [
            //move to mood tracker
            Center(
              child: Text(
                'Home Page',
                style: TextStyle(fontFamily: 'Inter', fontSize: 20),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: AppNavigation(),
    );
  }
}
