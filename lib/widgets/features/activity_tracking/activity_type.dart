import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants/colors.dart';

class CustomBoxItem extends StatelessWidget {
  final int index;
  final String imagePath;
  final String mainText;
  final String subText;

  CustomBoxItem({
    required this.index,
    required this.imagePath,
    required this.mainText,
    required this.subText,
  });

  @override
  Widget build(BuildContext context) {
    bool isOddIndex = index.isOdd;

    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey.shade300,
        //     blurRadius: 5,
        //     offset: const Offset(0, 3),
        //   ),
        // ],
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            isOddIndex ? Colors.white : AppColors.primaryColor,
            isOddIndex ? AppColors.primaryColor : Colors.white,
          ],
          stops: isOddIndex ? [0.1, 1] : [0, 0.9],
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (isOddIndex)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    mainText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    subText,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.transparent,
            ),
            child: SvgPicture.asset(
              imagePath, // Replace this with the actual path to your SVG image
              fit: BoxFit.cover,
            ),
          ),
          if (!isOddIndex)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    mainText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    subText,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
