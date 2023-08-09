import 'package:ayura/constants/colors.dart';

import 'package:flutter/material.dart';

Widget customGreyButton(
    {VoidCallback? tap,
    String? text = 'Save',
    IconData? icon,
    double? width,
    double? height,
    BuildContext? context}) {
  return GestureDetector(
    onTap: tap,
    child: Container(
      height: height ?? 48,
      width: width ?? MediaQuery.of(context!).size.width * 0.3,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.alternateGreyColor, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: icon != null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: AppColors.alternateGreyColor,
                ),
                const SizedBox(width: 10),
                Text(
                  text!,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: AppColors.alternateGreyColor,
                  ),
                ),
              ],
            )
          : Text(
              text!,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: AppColors.alternateGreyColor,
              ),
            ),
    ),
  );
}
