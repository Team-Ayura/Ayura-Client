import 'dart:collection';
import 'package:ayura/constants/colors.dart';

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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
            elevation: 0, //dropshadow
            automaticallyImplyLeading: false,
            toolbarHeight: 120.0,
            backgroundColor: AppColors.backgroundColor,
            title: const Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        'Good Morning!',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 22,
                            color: Color.fromRGBO(75, 75, 75, 1),
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'Dilanga Harshani',
                        style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 17,
                            color: Color.fromRGBO(75, 75, 75, 1),
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Expanded(
                    child: SizedBox(),
                  ),
                  IconButton(
                    onPressed: null,
                    icon: Icon(Icons.notifications_none_rounded),
                  ),
                ],
              ),
            )),
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
