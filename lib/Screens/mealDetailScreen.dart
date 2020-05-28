import 'package:flutter/material.dart';
import '../dummyData.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'MealDetailScreen';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute
        .of(context)
        .settings
        .arguments as String;
    final targetedMeal =
    DUMMY_MEALS.firstWhere((meal) => meal.mealId == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(targetedMeal.mealTitle),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),

        width: double.infinity,
        height: 400.0,
        child: Image.network(
          targetedMeal.imagePath,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
