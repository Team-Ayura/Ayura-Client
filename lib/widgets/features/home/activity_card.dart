import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

Widget activityCard({

  int? number,
  String? text,
  String? image
}) {
  return Container(
    padding: EdgeInsets.all(8),
    width: 110,
    height: 55,
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
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text!,
          style: const TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 5),
        Text(
          number.toString(),
          style: const TextStyle(
              color: AppColors.primaryColor,
              fontSize: 30,
              fontWeight: FontWeight.w400),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  '$image',
                )))
      ],
    ),
  );
}
