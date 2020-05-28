import 'package:flutter/material.dart';
import '../dummyData.dart';
import '../Widgets/mealsList.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = 'CategoryMealScreen';

  @override
  Widget build(BuildContext context) {
    final routeArguments =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String mealId = routeArguments['id'];
    final String mealTitle = routeArguments['title'];
    final categorizedMeals = DUMMY_MEALS.where((meal) {
      return meal.categoriesId.contains(mealId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(mealTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealsList(
            mealId: categorizedMeals[index].mealId,
            mealTitle: categorizedMeals[index].mealTitle,
            imagePath: categorizedMeals[index].imagePath,
            duration: categorizedMeals[index].duration,
            complexity: categorizedMeals[index].complexity,
            affordability: categorizedMeals[index].affordability,
          );
        },
        itemCount: categorizedMeals.length,
      ),
    );
  }
}
