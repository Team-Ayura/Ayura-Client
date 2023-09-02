import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

class AlarmDescription extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String time;
  final double width;

  const AlarmDescription({
    Key? key,
    required this.iconData,
    required this.title,
    required this.width,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double horizontalPadding = 0.15;
    double verticalPadding = 0.1;
    double aspectRatio = 0.8;
    double height = width / aspectRatio;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: height * verticalPadding,
        horizontal: width * horizontalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Icon(
                iconData,
                color: AppColors.primaryColor,
                size: height * 0.15,
              ),
              const SizedBox(width: 5.0),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Text(
            time,
            style: const TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
