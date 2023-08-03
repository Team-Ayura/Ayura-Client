import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MoodVariationChart extends StatelessWidget {
  MoodVariationChart({super.key});

  int choiceIndex = 0;

  //map mood,no of days with that mood
  //days with that mood/total days * 100%
  Map<String,double> dataMap = {
    "Happy": 18.47,
    "MIld Happy": 17.70,
    "Average": 4.25,
    "Sad": 3.51,
    "Worse": 2.83,
  };

  List<Color> colorList = [
      const Color(0xFF00DF59),
      const Color(0xFFADFF00),
      const Color(0xFFFFD600),
      const Color(0xFF00DF59),
      const Color(0xFFF36C24),
      const Color(0xFFFF0000),

  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:AppStyles.containerDecoration,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
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
              showChartValuesInPercentage: true,
              showChartValueBackground: true,
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