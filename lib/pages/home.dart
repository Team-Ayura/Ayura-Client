import 'dart:collection';
import 'package:ayura/auth/login.dart';
import 'package:ayura/provider/autProvider/authentication_provider.dart';
import 'package:ayura/pages/features/mood_tracking/page1.dart';
import 'package:ayura/utils/convertDate.dart';
import 'package:ayura/utils/router.dart';
import 'package:dob_input_field/dob_input_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ayura/constants/styles.dart';
import 'package:provider/provider.dart';

import '../utils/router.dart';
import 'features/activity_tracking/activity.dart';

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
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () {
              PageNavigator(context: context).nextPage(const Login());
            },
          )),
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: Text('Hello'),
            ),
            TextButton(
                onPressed: () {
                  print(birthdayController.text);
                  print(convertDate(birthdayController.text));
                },
                child: Text('Save')),
            //move to mood tracker
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectMood(),
                    ),
                  );
                },
                child: const Text('Mood')),
            TextButton(
                onPressed: () {
                  PageNavigator(context: context).nextPage(Activities());
                },
                child: const Text('activity')),
          ],
        ),
      ),
    );
  }
}
