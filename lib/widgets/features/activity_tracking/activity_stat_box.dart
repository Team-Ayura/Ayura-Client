import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/colors.dart';

class ActivityStatBox extends StatelessWidget {
  final String svgName;
  final String value;
  final String label;
  final bool isPercentageValue;

  ActivityStatBox({
    required this.svgName,
    required this.value,
    required this.label,
    bool? isPercentageValue,
  }) : isPercentageValue = isPercentageValue ?? false;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/icons/features/activity_tracking/$svgName',
              width: 48,
              height: 48,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              (isPercentageValue && int.parse(value) >= 0)
                  ? '+$value%'
                  : (isPercentageValue)
                      ? '$value%'
                      : value,
              style: TextStyle(
                color: (isPercentageValue && int.parse(value) >= 0)
                    ? Colors.green
                    : (isPercentageValue == true)
                        ? Colors.redAccent
                        : AppColors.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(
                color: AppColors.textColor.withOpacity(0.3),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
