 // Import your ActivityStatBox widget

import 'dart:io';
import 'package:intl/intl.dart';
import 'package:ayura/widgets/features/activity_tracking/activity_stat_box.dart';
import 'package:flutter/material.dart';

class CollageWithStatsWidget extends StatelessWidget {
  final List<String> imagePaths;
  final String locationName;
  final String durationValue;
  final int caloriesValue;
  final double speedValue;

  CollageWithStatsWidget({
    required this.imagePaths,
    required this.locationName,
    required this.durationValue,
    required this.caloriesValue,
    required this.speedValue,
  });

  @override
  Widget build(BuildContext context) {
    final NumberFormat numberFormat = NumberFormat('#,###');
    final String calorieCount = numberFormat
        .format(caloriesValue)
        .toString();
    final String improvement =
        "${speedValue.toString()} Km/h";
    return Column(
      children: [
        // Collage of Images
        Container(
          margin: const EdgeInsets.all(0),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(
              6,
                  (index) {
                if (index < imagePaths.length) {
                  return Image.file(
                    File(imagePaths[index]),
                    width: MediaQuery.of(context).size.width / 4 - 10,
                    height: MediaQuery.of(context).size.width / 4 - 10,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Container(
                    width: MediaQuery.of(context).size.width / 4 - 10,
                    height: MediaQuery.of(context).size.width / 4 - 10,
                  );
                }
              },
            ),
          ),
        ),
        SizedBox(height: 10),
        // Location Name
        // Activity Statistics
        Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ActivityStatBox(
                    svgName: 'clock.svg',
                    value: durationValue,
                    label: 'Duration\n',
                  ),
              const SizedBox(width: 10),
              ActivityStatBox(
                    svgName: 'heart.svg',
                    value: calorieCount,
                    label: 'Calories\n',
                  ),
              const SizedBox(width: 10),
              ActivityStatBox(
                    svgName: 'chart.svg',
                    value: improvement,
                    label: 'Average\nSpeed',
                  ),
            ],
          ),
        ),
      ],
    );
  }
}
