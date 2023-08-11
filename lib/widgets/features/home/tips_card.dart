import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

Widget tipsCard({
  IconData? icon,
  String? title,
  String? CTA,
  Color? iconColor,
  String? descritpion,
  required double height,
}) {
  return Container(
    height: height,
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
           icon != null ? TextButton.icon(
              onPressed: () {},
              icon: Icon(
                icon,
                size: 24.0,
                color: iconColor ?? AppColors.primaryColor,
              ),
              label: Text(title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400)),
            ): TextButton(
              onPressed: () {},
              child: Text(title!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w400)),
            ),  
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: TextButton.icon(
                onPressed: () {},
                label: Text(
                  CTA!,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 24.0,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text(
            descritpion ?? '',
            style: TextStyle(
              color: Color.fromARGB(255, 134, 134, 134),
              fontSize: 16.0,
            ),
          ),
        )
      ],
    ),
  );
}
