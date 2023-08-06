import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/activity_tracking/activity.dart';
import 'package:ayura/pages/features/activity_tracking/cycling_on_ride.dart';
import 'package:ayura/provider/activityProviders/cyclingOnRideProvider.dart';
import 'package:ayura/provider/activityProviders/cyclingProvider.dart';
import 'package:ayura/provider/activityProviders/sportsProvider.dart';
import 'package:ayura/provider/models/sportModel.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/utils/snack_message.dart';
// import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/widgets/features/activity_tracking/activity_stat_box.dart';
import 'package:ayura/widgets/features/activity_tracking/add_time_popup.dart';
import 'package:ayura/widgets/features/activity_tracking/chart.dart';
import 'package:ayura/widgets/features/activity_tracking/cycle_ride_box.dart';
import 'package:ayura/widgets/features/activity_tracking/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SelectedSportPage extends StatefulWidget {
  final SportModel selectedSport;
  const SelectedSportPage({Key? key, required this.selectedSport})
      : super(key: key);

  @override
  State<SelectedSportPage> createState() => _SelectedSportPageState();
}

class _SelectedSportPageState extends State<SelectedSportPage> {
  bool isHiddenSectionActive = false;
  TimeOfDay startTime = TimeOfDay.now();
  TimeOfDay finishTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat('#,###');

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedSport.name),
        backgroundColor: AppColors.primaryColor,
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
            // the chart
            Container(
              height: 200,
              padding: const EdgeInsets.all(10),
              child: Consumer<SportsProvider>(
                  builder: (context, sportsProvider, _) {
                return BarChartWeekly(
                    yAxisLabel: 'Duration',
                    filter: sportsProvider.selectedFilter,
                    data: sportsProvider.chartduration);
              }),
            ),

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
                    Consumer<SportsProvider>(
                        builder: (context, sportsProvider, _) {
                      final String duration = sportsProvider.duration;
                      return ActivityStatBox(
                        svgName: 'clock.svg',
                        value: duration,
                        label: 'Duration',
                      );
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    Consumer<SportsProvider>(
                        builder: (context, sportsProvider, _) {
                      final String calorieCount = numberFormat
                          .format(sportsProvider.calorieCount)
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
                    Consumer<SportsProvider>(
                        builder: (context, sportsProvider, _) {
                      final String improvement =
                          sportsProvider.improvement.toString();
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
            const SizedBox(
              height: 10,
            ),
            // if (isHiddenSectionActive)
            AnimatedOpacity(
              duration: Duration(milliseconds: 100),
              opacity: isHiddenSectionActive ? 1.0 : 0.0,
              child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  child: isHiddenSectionActive
                      ? Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: Colors.grey.shade300,
                              //     blurRadius: 5,
                              //     offset: const Offset(0, 3),
                              //   ),
                              // ],
                              ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Started Time   ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 7),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          color: AppColors.textColor
                                              .withOpacity(0.3),
                                        )),
                                    child: Text(
                                      '${startTime.hour}:${startTime.minute}',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        final input = await showTimePicker(
                                            context: context,
                                            initialTime: startTime);
                                        if (input != null) {
                                          setState(() {
                                            startTime = input;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.textColor
                                                .withOpacity(0.075),
                                            border: Border.all(
                                                color: AppColors.textColor
                                                    .withOpacity(0.1))),
                                        child: Icon(
                                          Icons.timer_outlined,
                                          color: AppColors.primaryColor,
                                          size: 26,
                                        ),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Finished Time ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 7),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                          color: AppColors.textColor
                                              .withOpacity(0.3),
                                        )),
                                    child: Text(
                                      '${finishTime.hour}:${finishTime.minute}',
                                      style: TextStyle(fontSize: 30),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                      onTap: () async {
                                        final input = await showTimePicker(
                                            context: context,
                                            initialTime: finishTime);
                                        if (input != null) {
                                          setState(() {
                                            finishTime = input;
                                          });
                                        }
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.textColor
                                                .withOpacity(0.075),
                                            border: Border.all(
                                                color: AppColors.textColor
                                                    .withOpacity(0.1))),
                                        child: Icon(
                                          Icons.timer_outlined,
                                          color: AppColors.primaryColor,
                                          size: 26,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container()),
            ),
            // start cycling button
            Consumer<SportsProvider>(builder: (context, sportsProvider, _) {
              return GestureDetector(
                onTap: () {
                  if (isHiddenSectionActive) {
                    sportsProvider.addEntrySportHistory(
                        widget.selectedSport.id, startTime, finishTime);
                    showMessage(context, "Successfully added!");
                  }
                  setState(() {
                    isHiddenSectionActive = !isHiddenSectionActive;
                  });
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(8)),
                  child: const Center(
                    child: Text(
                      'Add New',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              );
            }),
            // about section
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'About ${widget.selectedSport.name}',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors
                          .grey.shade200, // Set your desired button color here
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Unleash the sports\' potential in our app! Connect globally, enhance health, teamwork, and grow personally. Join us to share the passion, unite cultures, and play together. Let\'s start!',
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

  Consumer<SportsProvider> _buildCustomButton(String buttonText, int index) {
    return Consumer<SportsProvider>(builder: (context, sportsProvider, _) {
      bool isActive = sportsProvider.selectedFilter == buttonText;
      return Expanded(
        child: GestureDetector(
          onTap: () => sportsProvider.updateFilter(buttonText),
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

  void showPopUp(BuildContext context, String sportid) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddTimePopUp(
          sportid: sportid,
        );
      },
    );
  }
}
