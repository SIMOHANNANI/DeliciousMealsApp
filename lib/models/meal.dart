import 'package:flutter/material.dart';

enum Complexity { Simple, Challenging, Hard }
enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String mealId; // The id of the meal.
  final String mealTitle; //The meal title.
  final List<String> mealIngredients; // the meal ingredient.
  final List<String> categoriesId; // the meal category.
  final String imagePath; // the descriptive image of the meal.
  final List<String> steps; // the step followed to make it.
  final int duration; // The estimated time of preparation.
  final Complexity complexity; // The complexity of the meal;
  final Affordability affordability; //The affordability of the meal.

  final bool isGlutenFree;
  final bool isVegan;
  final bool isLactoseFree;
  final bool isVegetarian;

  const Meal({
    @required this.mealId,
    @required this.mealTitle,
    @required this.mealIngredients,
    @required this.categoriesId,
    @required this.imagePath,
    @required this.steps,
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });
}
