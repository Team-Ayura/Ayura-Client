import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

Widget tipsCard({
  IconData? icon,
  String? title,
  required String cta,
  Color? iconColor,
  String? descritpion,
  required double height,
}) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: const [
        BoxShadow(
          color: Color.fromARGB(69, 158, 158, 158),
          blurRadius: 2.0,
        ),
      ],
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon != null
                ? TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.abc,
                      size: 24.0,
                      color: iconColor ?? AppColors.yellowColor,
                    ),
                    label: Text(
                      title!,
                      style: const TextStyle(
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontFamily: "Inter",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  )
                : Flexible(
                  child: Text(
                    title!,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
          ],
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            descritpion ?? '',
            style: const TextStyle(
              color: Color.fromARGB(255, 134, 134, 134),
              fontSize: 14.0,
              fontFamily: "Inter",
            ),
          ),
        )
      ],
    ),
  );
}
