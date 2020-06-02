import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../Widgets/mealsList.dart';

class Favorites extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  Favorites(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    if (_favoriteMeals.isEmpty) {
      return Center(
        child: Text("No favorite meals at the moment - Wannan add some ?"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsList(
            mealId: _favoriteMeals[index].mealId,
            mealTitle: _favoriteMeals[index].mealTitle,
            imagePath: _favoriteMeals[index].imagePath,
            duration: _favoriteMeals[index].duration,
            complexity: _favoriteMeals[index].complexity,
            affordability: _favoriteMeals[index].affordability,
          );
        },
        itemCount: _favoriteMeals.length,
      );
    }
  }
}
