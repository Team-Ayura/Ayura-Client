import 'package:flutter/material.dart';
import 'package:ayura/constants/colors.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/pages/features/mealPlan/viewmeal_screen.dart';

class MealCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double calories;

  const MealCard({required this.name, required this.imagePath, required this.calories});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageNavigator(context: context).nextPage(const ViewmealScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                name,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  color: AppColors.textColor,
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$calories kcal',
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: AppColors.textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 50),
                const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 157, 10, 0),
                  size: 20,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
