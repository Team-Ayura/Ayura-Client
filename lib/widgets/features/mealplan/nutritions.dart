import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:pie_chart/pie_chart.dart';

Widget nutritions(BuildContext? context) {
  final width = MediaQuery.of(context!).size.width;
  Map<String, double> dataMap = {"Protien": 7.2, "Carbs": 32.1, "Fat": 6.9};
  final colorList = <Color>[const Color.fromARGB(255, 109, 248, 113), const Color.fromARGB(255, 249, 97, 86), const Color.fromARGB(255, 224, 130, 241)];
  return SizedBox(
      width: width * 0.8,
      child: PieChart(
        dataMap: dataMap,
        animationDuration: const Duration(milliseconds: 800),
        chartLegendSpacing: 32,
        chartRadius: MediaQuery.of(context).size.width / 3.2,
        colorList: colorList,
        initialAngleInDegree: 0,
        chartType: ChartType.disc,
        ringStrokeWidth: 32,
        legendOptions:const LegendOptions(
          showLegendsInRow: false,
          legendPosition: LegendPosition.right,
          showLegends: true,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
          showChartValues: true,
          showChartValuesInPercentage: true,
          showChartValuesOutside: false,
          decimalPlaces: 1,
        ),
      ));
}
