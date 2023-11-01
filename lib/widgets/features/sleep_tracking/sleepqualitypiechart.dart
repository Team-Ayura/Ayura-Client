import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class SleepQualitynChart extends StatelessWidget {
 SleepQualitynChart({super.key});

  int choiceIndex = 0;

  //map quality,no of days with that quality
  //days with that quality/total days * 100%
  Map<String,double> dataMap = {
    "Excessive Sleep Days": 1,
    "Good Sleep Days": 1,
    "Sufficient Sleep Days": 1,
    "Insufficient Sleep Days": 2,
    
  };

  List<Color> colorList = [
      const Color.fromARGB(255, 27, 158, 4), //Great
      const Color(0xFF00DF59), //Good
      const Color(0xFFFFD600), //Okay
      // const Color.fromARGB(255, 232, 121, 1), //Not Great
      const Color.fromARGB(255, 228, 8, 8), //Horrible
     
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:AppStyles.containerDecoration,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.center,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 10, 0, 8),
              child: Row(
                children: [
                  Text(
                    "Sleep Duration",
                    textAlign: TextAlign.left,
                    style: AppStyles.subheadingTextStyle2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 10, 20),
              child: PieChart(
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
            ),
          ],
        ), 
    );
  }
}