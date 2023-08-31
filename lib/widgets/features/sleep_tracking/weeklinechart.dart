

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants/styles.dart';

class WeeklyChart extends StatefulWidget {
  const WeeklyChart({super.key});

  @override
  State<WeeklyChart> createState() => _WeeklyChartState();
}

class _WeeklyChartState extends State<WeeklyChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          
          children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 8),
            child: Row(
                children: [
                  Text("Sleep Duration",style: AppStyles.subheadingTextStyle2,)
                ],
              ),
          ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 40, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 16,
                    height: 16,
                    
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const Text('Week 1'),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 270,
              padding: const EdgeInsets.only(left: 12),
              alignment: Alignment.center,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      axisNameWidget: Text("Days of Week"),
                     
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 30,
                        interval: 1,
                        getTitlesWidget: bottomTitleWidgets,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      axisNameWidget: Text("sleeping hours"),
                      axisNameSize: 25,
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: leftTitleWidgets,
                        reservedSize: 42,
                      ),
                    ),
                  ),
                  
                  borderData: FlBorderData(
                    show: false, // Set to false to remove the border and axis lines
                    border: Border.all(color: const Color(0xff37434d), width: 1),
                  ),
                  minX: 0,
                  maxX: 7, // Adjust the maximum value based on the total number of data points (days)
                  minY: 0,
                  maxY: 8,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        const FlSpot(0, 5),
                        const FlSpot(1, 2),
                        const FlSpot(2, 4),
                        const FlSpot(3, 2),
                        // const FlSpot(4, 7),
                        // const FlSpot(5, 5),
                        // const FlSpot(6, 8),
                      ],
                      isCurved: true,
                      gradient: LinearGradient(
                          colors: [Colors.blue.withOpacity(0.3),const Color.fromARGB(255, 117, 174, 209)],
                      ),
                      // colors: [Colors.blue.withOpacity(0.3)],
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(show: true, gradient: LinearGradient(
                          colors: [Colors.blue.withOpacity(0.1),const Color.fromARGB(255, 117, 174, 209)],
                        ),),
                    ),
                  ],
                 
                ),
              ),
            ),
          ],
        ),
      );
  }
}



  Widget leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      // fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0h';
        break;
      case 2:
         text = '2h';
         break;
      case 4:
        text = '4h';
        break;
      case 6:
        text = '6h';
        break;
      case 8:
        text = '8h';
        break;
      default:
       return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

 Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('S', style: style);
        break;
      case 1:
        text = const Text('M', style: style);
        break;
      case 2:
        text = const Text('T', style: style);
        break;
      case 3:
        text = const Text('W', style: style);
        break;
      case 4:
        text = const Text('T', style: style);
        break;
      case 5:
        text = const Text('F', style: style);
        break;
      case 6:
        text = const Text('S', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
  
 

