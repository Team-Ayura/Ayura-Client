import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget nutritions(BuildContext? context) {
  final width = MediaQuery.of(context!).size.width;
  return SizedBox(
    width: width * 0.8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 10.0,
          percent: 0.65,
          center: const Text("65%"),
          footer: const Text('Carbs'),
          progressColor: Colors.green,
          backgroundColor: const Color.fromRGBO(54, 244, 76, 0.161),
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(width: width * 0.02),
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 10.0,
          percent: 0.40,
          center: const Text("40%"),
          footer: const Text('Fat'),
          progressColor: Colors.red,
          backgroundColor: const Color.fromRGBO(244, 67, 54, 0.162),
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(width: width * 0.02),
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 10.0,
          percent: 0.60,
          center: const Text("60%"),
          footer: const Text('Protien'),
          progressColor: Colors.yellow,
          backgroundColor: const Color.fromRGBO(244, 225, 54, 0.278),
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(width: width * 0.02),
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 10.0,
          percent: 0.90,
          center: const Text("90%"),
          footer: const Text('Calories'),
          progressColor: const Color.fromARGB(255, 167, 76, 175),
          backgroundColor: const Color.fromRGBO(222, 54, 244, 0.275),
          circularStrokeCap: CircularStrokeCap.round,
        )
      ],
    ),
  );
}
