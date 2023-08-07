import 'package:ayura/constants/colors.dart';
import 'package:ayura/pages/features/activity_tracking/activity.dart';
import 'package:ayura/provider/activityProviders/cyclingOnRideProvider.dart';
import 'package:ayura/provider/activityProviders/cyclingProvider.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/global/custom_appbar.dart';
// import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/widgets/features/activity_tracking/activity_stat_box.dart';
import 'package:ayura/widgets/features/activity_tracking/chart.dart';
import 'package:ayura/widgets/features/activity_tracking/cycle_ride_box.dart';
import 'package:ayura/widgets/features/activity_tracking/image_container.dart';
import 'package:ayura/widgets/features/activity_tracking/map.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CyclingOnRidePage extends StatefulWidget {
  const CyclingOnRidePage({Key? key}) : super(key: key);

  @override
  State<CyclingOnRidePage> createState() => _CyclingOnRidePageState();
}

class _CyclingOnRidePageState extends State<CyclingOnRidePage> {
  int activeIndex = 0; // -1 means no active index

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat('#,###');
    // title: const Text('Cycling Started'),

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(90.0), // Set the preferred size here.
        child: CustomAppBar(
          appbarTitle: 'Cycling Started',
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
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: MapContainer(
                isRegular: true,
                latitude: 37.7749,
                longitude: -122.4194,
                markerTitle: 'Title',
              ),
            ),
            const SizedBox(
              height: 10,
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
                    Consumer<CyclingOnRideProvider>(
                        builder: (context, cyclingOnRideProvider, _) {
                      return ActivityStatBox(
                        svgName: 'clock.svg',
                        value: cyclingOnRideProvider.getFormattedTime(),
                        label: 'Duration',
                      );
                    }),
                    const SizedBox(
                      width: 10,
                    ),
                    Consumer<CyclingOnRideProvider>(
                        builder: (context, cyclingOnRideProvider, _) {
                      final String calorieCount = numberFormat
                          .format(cyclingOnRideProvider.calorieCounter)
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
                    Consumer<CyclingOnRideProvider>(
                        builder: (context, cyclingOnRideProvider, _) {
                      final String improvement =
                          "${cyclingOnRideProvider.cyclingSpeed.toString()} Km/h";
                      return ActivityStatBox(
                        svgName: 'chart.svg',
                        value: improvement,
                        label: 'Improvement',
                      );
                    }),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // pause resume stop cycling button
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
                    Expanded(
                      child: Consumer<CyclingOnRideProvider>(
                          builder: (context, cyclingOnRideProvider, _) {
                        return GestureDetector(
                          onTap: () {
                            cyclingOnRideProvider.isPaused
                                ? cyclingOnRideProvider.resumeCycling()
                                : cyclingOnRideProvider.pauseCycling();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.orangeAccent.shade200,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(
                              child: Text(
                                cyclingOnRideProvider.isPaused
                                    ? 'Resume'
                                    : 'Pause',
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Consumer<CyclingOnRideProvider>(
                          builder: (context, cyclingOnRideProvider, _) {
                        return GestureDetector(
                          onTap: () {
                            cyclingOnRideProvider.stopCycling();
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius: BorderRadius.circular(8)),
                            child: const Center(
                              child: Text(
                                'Stop',
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
                    ),
                  ],
                ),
              ),
            ),
            // about section
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Photos',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Consumer<CyclingOnRideProvider>(
                      builder: (context, cyclingOnRideProvider, _) {
                    return ImageContainer(
                      cyclingOnRideProvider: cyclingOnRideProvider,
                    );
                  }),
                ],
              ),
            ),

            // previouse trips

            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About Cycling',
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
                      'Cycle your way to better health and fitness. Ayura encourages and tracks your cycling rides, helping you stay active and enjoy the journey towards a healthier lifestyle.',
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

  Consumer<CyclingProvider> _buildCustomButton(String buttonText, int index) {
    return Consumer<CyclingProvider>(
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
