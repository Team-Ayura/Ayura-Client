import 'package:ayura/constants/colors.dart';
import 'package:ayura/constants/styles.dart';
import 'package:flutter/material.dart';

Widget customButton(
    {VoidCallback? tap,
    bool? status = false,
    String? text = 'Save',
    BuildContext? context}) {
  return GestureDetector(
    onTap: status == true ? null : tap,
    child: Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: status == false
              ? AppColors.primaryColor
              : AppColors.disabledColor,
          borderRadius: BorderRadius.circular(8)),
      width: MediaQuery.of(context!).size.width,
      child: Text(
        status == false ? text! : 'Please wait...',
        style: AppStyles.bodyTextStyle,
      ),
    ),
  );
}
