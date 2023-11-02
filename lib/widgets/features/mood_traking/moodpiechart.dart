import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MoodVariationChart extends StatelessWidget {
  MoodVariationChart({super.key});

  int choiceIndex = 0;

  //map mood,no of days with that mood
  //days with that mood/total days * 100%
  Map<String,double> dataMap = {
    "Happy Days": 1,
    "Tired Days": 0,
    "Sad Days": 1,
    "Angry Days": 1,
    "Stressed Days": 2,
    "Bored Days": 0,
  };

  List<Color> colorList = [
      // const Color(0xFF00DF59), //happy
      // const Color(0xFF00DF59), //calm
      // const Color(0xFFADFF00), //
      // const Color(0xFFFFD600),
      // const Color(0xFFF36C24),
      // const Color(0xFFFF0000),

      const Color(0xFF00DF59), //happy
      // const Color(0xFFA6D8DE), //calm
      const Color(0xFFFFD600), //tired
      const Color.fromARGB(255, 110, 160, 3), //sad
      const Color(0xFFFF2400), //angry
      const Color(0xFF6E8B7E), //stressed
      // const Color(0xFF4B0082), //lonelyg
      // const Color(0xFF98FB98), //sick
      const Color.fromARGB(255, 105, 206, 236), //bored

      

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:AppStyles.containerDecoration,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(25, 20, 15, 20),
        child:Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Mood Variations",
                textAlign: TextAlign.left,
                style: AppStyles.subheadingTextStyle2,
              ),
            ),
            const SizedBox(height: 20,),
            PieChart(
            dataMap: dataMap,
            colorList: colorList,
            chartType: ChartType.ring,
            ringStrokeWidth: 20,
            animationDuration: const Duration(seconds: 2),
            chartRadius: MediaQuery.of(context).size.width/2,
            chartValuesOptions: const ChartValuesOptions(
              showChartValues: true,
              showChartValuesOutside: true,
              showChartValuesInPercentage: false,
              showChartValueBackground: true,
              decimalPlaces: 0,
            ),
            legendOptions: const LegendOptions(
              showLegends: true,
              legendShape: BoxShape.rectangle,
              legendTextStyle: TextStyle(fontSize: 12),
            ),
           ),
          ],
        ),
        
        
    );
  }
}