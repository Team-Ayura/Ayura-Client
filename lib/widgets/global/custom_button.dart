import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';

Widget customButton(
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
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(8)),
      child: icon != null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text!,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  icon,
                  color: Colors.white,
                )
              ],
            )
          : Text(
              text!,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                color: Colors.white,
              ),
            ),
    ),
  );
}
