import 'dart:ffi';

import 'package:flutter/material.dart';

class Meal {
  String mealId;
  String name;
  String image;
  double mainmass;
  double sidemass;
  double protein;
  double carbs;
  double fat;
  double calories;

  Meal({
    required this.mealId,
    required this.name,
    required this.image,
    required this.mainmass,
    required this.sidemass,
    required this.protein,
    required this.carbs,
    required this.fat,
    required this.calories,
  });
}
