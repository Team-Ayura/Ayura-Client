import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

class BarChartWeekly extends StatefulWidget {
  final List<int> data;
  final String yAxisLabel;
  final ChartFilterType filter;
  BarChartWeekly(
      {super.key,
      required this.yAxisLabel,
      required this.filter,
      required this.data});

  final Color barBackgroundColor = Colors.grey.shade200;
  final Color barColor = AppColors.primaryColor.withOpacity(0.8);
  final Color touchedBarColor = AppColors.primaryColor;

  @override
  State<StatefulWidget> createState() => BarChartWeeklyState();
}

class BarChartWeeklyState extends State<BarChartWeekly> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
      // swapAnimationDuration: animDuration,
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    // double width = 25,
    double? width,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    width ??= widget.filter == ChartFilterType.day
        ? 7
        : widget.filter == ChartFilterType.week
            ? 25
            : widget.filter == ChartFilterType.month
                ? 5
                : 15;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
            toY: isTouched ? y + 1 : y,
            color: isTouched ? widget.touchedBarColor : barColor,
            width: width,
            borderSide: isTouched
                ? BorderSide(color: widget.touchedBarColor)
                : const BorderSide(color: Colors.white, width: 0),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              // toY: 14,
              toY: widget.data
                      .reduce(
                          (value, element) => value > element ? value : element)
                      .toDouble() +
                  1,
              color: widget.barBackgroundColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() {
    return List.generate(widget.data.length, (i) {
      return makeGroupData(i, widget.data[i].toDouble(),
          isTouched: i == touchedIndex);
    });
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.black.withOpacity(0.8),
          tooltipHorizontalAlignment: FLHorizontalAlignment.center,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String stepCount;
            return BarTooltipItem(
              '${widget.yAxisLabel}\n',
              TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY.toInt() - 1).toString(),
                  style: TextStyle(
                    color: widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 30,
          ),
        ),
        leftTitles: const AxisTitles(
          axisNameSize: 12,
          sideTitles: SideTitles(
            reservedSize: 40,
            showTitles: true,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(
        show: true,
      ),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (widget.filter) {
      case ChartFilterType.week:
        switch (value.toInt()) {
          case 0:
            text = const Text('Mon', style: style);
            break;
          case 1:
            text = const Text('Tue', style: style);
            break;
          case 2:
            text = const Text('Wed', style: style);
            break;
          case 3:
            text = const Text('Thu', style: style);
            break;
          case 4:
            text = const Text('Fri', style: style);
            break;
          case 5:
            text = const Text('Sat', style: style);
            break;
          case 6:
            text = const Text('Sun', style: style);
            break;
          default:
            text = const Text('', style: style);
            break;
        }
        break;
      case ChartFilterType.month: // filter by month
        switch (value.toInt()) {
          case 4:
            text = const Text('5', style: style);
            break;
          case 11:
            text = const Text('12', style: style);
            break;
          case 18:
            text = const Text('19', style: style);
            break;
          case 25:
            text = const Text('25', style: style);
            break;
          default:
            text = const Text('', style: style);
            break;
        }
        break;
      case ChartFilterType.year: // filter by year
        switch (value.toInt()) {
          case 0:
            text = const Text('Jan', style: style);
            break;
          case 1:
            text = const Text('Feb', style: style);
            break;
          case 2:
            text = const Text('Mar', style: style);
            break;
          case 3:
            text = const Text('Apr', style: style);
            break;
          case 4:
            text = const Text('May', style: style);
            break;
          case 5:
            text = const Text('Jun', style: style);
            break;
          case 6:
            text = const Text('Jul', style: style);
            break;
          case 7:
            text = const Text('Aug', style: style);
            break;
          case 8:
            text = const Text('Sep', style: style);
            break;
          case 9:
            text = const Text('Oct', style: style);
            break;
          case 10:
            text = const Text('Nov', style: style);
            break;
          case 11:
            text = const Text('Dec', style: style);
            break;
          default:
            text = const Text('', style: style);
            break;
        }
        break;
      default:
        switch (value.toInt()) {
          case 1:
            text = const Text('12 AM', style: style);
            break;
          case 7:
            text = const Text('6 AM', style: style);
            break;
          case 14:
            text = const Text('12 PM', style: style);
            break;
          case 21:
            text = const Text('6 PM', style: style);
            break;
          default:
            text = const Text('', style: style);
            break;
        }
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
