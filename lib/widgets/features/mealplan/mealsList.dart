import 'package:ayura/constants/data.dart';
import 'package:ayura/pages/features/mealPlan/viewmeal_screen.dart';
import 'package:ayura/utils/router.dart';
import 'package:ayura/widgets/features/mealplan/meal_card.dart';
import 'package:flutter/material.dart';
import 'package:ayura/constants/colors.dart';

class MealsList extends StatelessWidget {
  const MealsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8.0, // Spacing between columns
          mainAxisSpacing: 8.0, // Spacing between rows
          mainAxisExtent: 220, //Vertical height of each cell
        ),
        itemCount: 3,
        itemBuilder: (context, index) {
          return MealCard(
          imagePath: mealList[index].image,
          calories: mealList[index].calories,
          
        );
        });
  }
}
