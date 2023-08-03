import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

Widget nutritions(BuildContext? context) {
  final width = MediaQuery.of(context!).size.width;
  return Container(
    width: width * 0.8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 10.0,
          percent: 0.65,
          center: const Text("65%"),
          footer: Text('Carbs'),
          progressColor: Colors.green,
          backgroundColor: Color.fromRGBO(54, 244, 76, 0.161),
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(width: width * 0.02),
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 10.0,
          percent: 0.40,
          center: const Text("40%"),
          footer: Text('Fat'),
          progressColor: Colors.red,
          backgroundColor: Color.fromRGBO(244, 67, 54, 0.162),
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(width: width * 0.02),
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 10.0,
          percent: 0.60,
          center: const Text("60%"),
          footer: Text('Protien'),
          progressColor: Colors.yellow,
          backgroundColor: Color.fromRGBO(244, 225, 54, 0.278),
          circularStrokeCap: CircularStrokeCap.round,
        ),
        SizedBox(width: width * 0.02),
        CircularPercentIndicator(
          radius: 35.0,
          lineWidth: 10.0,
          percent: 0.90,
          center: const Text("90%"),
          footer: Text('Calories'),
          progressColor: Color.fromARGB(255, 167, 76, 175),
          backgroundColor: Color.fromRGBO(222, 54, 244, 0.275),
          circularStrokeCap: CircularStrokeCap.round,
        )
      ],
    ),
  );
}
