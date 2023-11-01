import 'package:ayura/constants/colors.dart';
import 'package:ayura/provider/activityProviders/cyclingOnRideProvider.dart';
import 'package:ayura/provider/activityProviders/cyclingProvider.dart';
import 'package:ayura/provider/activityProviders/walkAndRunningProvider.dart';
import 'package:ayura/widgets/features/activity_tracking/sharable_image_collage.dart';
import 'package:ayura/widgets/features/activity_tracking/activity_stat_box.dart';
import 'package:ayura/widgets/features/activity_tracking/image_container.dart';
import 'package:ayura/widgets/features/activity_tracking/map.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:ui' as ui;

class CyclingOnRidePage extends StatefulWidget {
  const CyclingOnRidePage({Key? key}) : super(key: key);

  @override
  State<CyclingOnRidePage> createState() => _CyclingOnRidePageState();
}

class _CyclingOnRidePageState extends State<CyclingOnRidePage> {
  final GlobalKey<State<StatefulWidget>> _widgetKey = GlobalKey();
  var panelController = PanelController();
  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat('#,###');
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.7;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
      body: Stack(
        children: [
          SlidingUpPanel(
            controller: panelController,
            minHeight: panelHeightClosed,
            maxHeight: panelHeightOpen,
            parallaxEnabled: true,
            parallaxOffset: 0.7,
            body: Consumer<CyclingOnRideProvider>(
              builder: (context, cyclingOnRideProvider, _) {
                Position? position = cyclingOnRideProvider.currentLocation;
                if (position != null) {
                  return MapContainer(
                    isRegular: true,
                    latitude:  6.90215097043552,
                    longitude:  79.86117498503802,
                    markerTitle: "Colombo",
                  );
                } else {
                  // Handle cases where the location is not available.
                  return const Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2, // You can adjust the thickness as needed
                      ),
                    ),
                  );// or other UI elements
                }
              },
            ),

          panelBuilder: (controller) => PanelWidget(
              controller: controller,
              panelController: panelController,
            ),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(18),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: BackButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: const Text(''),
              backgroundColor: AppColors.textColor.withOpacity(0.2),
              elevation: 0,
            ),
          ),
        ],
      ),
    );
  }

  Consumer<CyclingProvider> _buildCustomButton(ChartFilterType buttonText, int index) {
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
                  buttonText.label.substring(0, 1).toUpperCase(),
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

class PanelWidget extends StatefulWidget {
  final ScrollController controller;
  PanelController panelController;
  bool isOpenPanel = false;
  PanelWidget(
      {Key? key, required this.controller, required this.panelController})
      : super(key: key);

  @override
  State<PanelWidget> createState() => _PanelWidgetState();
}

class _PanelWidgetState extends State<PanelWidget> {
  final GlobalKey<State<StatefulWidget>> _collageKey = GlobalKey();
  final NumberFormat numberFormat = NumberFormat('#,###');
  final _screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.only(top: 10),
        controller: widget.controller,
        children: <Widget>[
          buildDragHandle(),
          const SizedBox(
            height: 10,
          ),
          buildOnRideScreenContent(),
          const SizedBox(
            height: 10,
          ),
        ]);
  }

  void togglePanel() {
    if (widget.isOpenPanel) {
      widget.panelController.close();
    } else {
      widget.panelController.open();
    }
    widget.isOpenPanel = !widget.isOpenPanel;
  }

  Widget buildDragHandle() => Center(
        child: GestureDetector(
          onTap: () => togglePanel(),
          child: Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
                color: AppColors.textColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
      );

  Widget buildOnRideScreenContent() => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                              color: AppColors.primaryColor,
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
                          if(cyclingOnRideProvider.imagePaths.isNotEmpty) {
                            _showCollageDialog(context);
                          }
                          // here I should show the caputred snapshot of the widget and make it sharable
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

          const SizedBox(
            height: 10,
          ),
        ],
      );

  Future<Uint8List> captureWidget(GlobalKey key) async {
    RenderRepaintBoundary boundary =
    key.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);

    if (byteData != null) {
      return byteData.buffer.asUint8List();
    } else {
      throw Exception('Failed to capture widget snapshot.');
    }
  }

  Future<void> shareCapturedImage(Uint8List imageBytes) async {
    await Share.shareXFiles(
      [
        XFile.fromData(imageBytes, name: 'activity_snapshot.png')
      ],
      text: 'Check out my cycling activity!',
    );
  }


  void _showCollageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height - 300,
            child: Consumer<CyclingOnRideProvider>(
              builder: (context, cyclingOnRideProvider, _) {
                return Column(
                  children: [
                    Screenshot(
                      controller: _screenshotController,
                      child: RepaintBoundary(
                        key: _collageKey,
                        child: CollageWithStatsWidget(
                          imagePaths: cyclingOnRideProvider.imagePaths,
                          locationName: 'Bellanwila Park Ride',
                          durationValue: cyclingOnRideProvider.getFormattedTime(),
                          caloriesValue: cyclingOnRideProvider.calorieCounter,
                          speedValue: cyclingOnRideProvider.cyclingSpeed,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      // onPressed: takeScreenshot,
                        onPressed: () async {
                      final imageBytes = await captureWidget(_collageKey);
                      await shareCapturedImage(imageBytes);
                    },
                        child: const Text('Share')),
                  ],
                );
              }
            ),
          ),
        );
      },
    );
  }

  void takeScreenshot() async {
    final imageFile = await _screenshotController.capture();
    // Share.shareXFiles(
    //     [XFile.fromData(
    //       buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
    //       name: 'flutter_logo.png',
    //       mimeType: 'image/png',
    //     ),]
    // );
  }

}
