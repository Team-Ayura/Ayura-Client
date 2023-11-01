import 'package:ayura/constants/colors.dart';
import 'package:flutter/material.dart';

Widget diaryactivityCard({String? number,String? text, String? image}) {
  return Container(
    padding: const EdgeInsets.all(10),
    width: 110,
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
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: "Inter",
            
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              '$image',
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              number.toString(),
              style: const TextStyle(
                color: AppColors.primaryColor,
                fontSize: 18,
                fontFamily: "Inter",
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
