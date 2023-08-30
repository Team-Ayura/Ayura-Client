import 'package:ayura/constants/colors.dart';
import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/widgets/features/activity_tracking/activity_stat_box.dart';
import 'package:ayura/widgets/features/activity_tracking/chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';

class WalkingAndRunningPage extends StatefulWidget {
  const WalkingAndRunningPage({Key? key}) : super(key: key);

  @override
  State<WalkingAndRunningPage> createState() => _WalkingAndRunningPageState();
}

class _WalkingAndRunningPageState extends State<WalkingAndRunningPage> {
  int activeIndex = 0; // -1 means no active index

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat('#,###');

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0), // Set the preferred size here.
        child: CustomAppBar(
          appbarTitle: 'Walking & Running',
          isBackBtn: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // the time navigation
            Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    Colors.grey.shade200, // Set your desired button color here
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildCustomButton('D', 0),
                  _buildCustomButton('W', 1),
                  _buildCustomButton('M', 2),
                  _buildCustomButton('Y', 3),
                ],
              ),
            ),
            Consumer<WalkingAndRunningProvider>(
              builder: (context, walkAndRunningProvider, _) {
                return Container(margin: EdgeInsets.only(left: 25), child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Average Step Count', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryColor)),
                    SizedBox(height:5),
                    Text(walkAndRunningProvider.timePeriod, style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor.withOpacity(0.5))),
                  ],
                ));
              }
            ),
            SizedBox(height:5),
            // the chart
            Container(
              height: 200,
              padding: const EdgeInsets.all(10),
              child: Consumer<WalkingAndRunningProvider>(
                  builder: (context, walkingAndRunningProvider, _) {
                return BarChartWeekly(
                    yAxisLabel: 'Average Steps',
                    filter: walkingAndRunningProvider.selectedFilter,
                    data: walkingAndRunningProvider.steps);
              }),
            ),
            // steps & distance
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor
                      .withOpacity(0.3), // Set your desired button color here
                  borderRadius: BorderRadius.circular(8.0),
                  // border: Border.all(
                  //   color: AppColors.primaryColor,
                  //   width: 2,
                  // ),
                ),
                child: Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 200,
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 10,
                          right: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors
                              .white, // Set your desired button color here
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(50),
                              // bottomRight: Radius.circular(35),
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Average Steps',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Consumer<WalkingAndRunningProvider>(builder:
                                (context, walkingAndRunningProvider, _) {
                              final String stepCount = numberFormat
                                  .format(walkingAndRunningProvider.stepCount)
                                  .toString();
                              return Text(
                                stepCount,
                                style: const TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w500,
                                ),
                              );
                            }),
                          ],
                        ),
                      ),
                      Container(),
                    ],
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor
                      .withOpacity(0.3), // Set your desired button color here
                  borderRadius: BorderRadius.circular(8.0),
                  // border: Border.all(
                  //   color: AppColors.primaryColor,
                  //   width: 2,
                  // ),
                ),
                child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(),
                      Container(
                        width: 200,
                        padding: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                          left: 10,
                          right: 10,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors
                              .white, // Set your desired button color here
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              // topLeft: Radius.circular(35),
                              topRight: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Average Distance',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Consumer<WalkingAndRunningProvider>(builder:
                                    (context, walkingAndRunningProvider, _) {
                                  final String distance =
                                      walkingAndRunningProvider.distance
                                          .toString();
                                  return Text(
                                    distance,
                                    style: const TextStyle(
                                      fontSize: 36,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  );
                                }),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'Km',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),

            // row of duration calories & improvement
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(
                color: Colors.white
                    .withOpacity(0.3), // Set your desired button color here
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Consumer<WalkingAndRunningProvider>(
                        builder: (context, walkingAndRunningProvider, _) {
                      final String duration =
                          walkingAndRunningProvider.duration;
                      return ActivityStatBox(
                        svgName: 'clock.svg',
                        value: duration,
                        label: 'Duration',
                      );
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    Consumer<WalkingAndRunningProvider>(
                        builder: (context, walkingAndRunningProvider, _) {
                      final String calorieCount = numberFormat
                          .format(walkingAndRunningProvider.calorieCount)
                          .toString();
                      return ActivityStatBox(
                        svgName: 'heart.svg',
                        value: calorieCount,
                        label: 'Calories',
                      );
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    Consumer<WalkingAndRunningProvider>(
                        builder: (context, walkingAndRunningProvider, _) {
                      final String improvement =
                          walkingAndRunningProvider.improvement.toString();
                      return ActivityStatBox(
                        svgName: 'chart.svg',
                        value: improvement,
                        label: 'Improvement',
                        isPercentageValue: true,
                      );
                    }),
                  ],
                ),
              ),
            ),
            // about section
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About walking & Running',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors
                          .grey.shade200, // Set your desired button color here
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Discover the ultimate fitness app for tracking your walking and running activities. Set goals, monitor progress, and stay motivated as you achieve your health and wellness milestones. Let\'s start the journey!',
                      style: TextStyle(
                          fontSize: 16,
                          color: AppColors.textColor.withOpacity(0.4)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Consumer<WalkingAndRunningProvider> _buildCustomButton(
      String buttonText, int index) {
    return Consumer<WalkingAndRunningProvider>(
        builder: (context, walkingAndRunningProvider, _) {
      bool isActive = walkingAndRunningProvider.selectedFilter == buttonText;
      return Expanded(
        child: GestureDetector(
          onTap: () => walkingAndRunningProvider.updateFilter(buttonText),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primaryColor : Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity: isActive ? 1.0 : 0.7,
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: isActive ? Colors.white : AppColors.textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
