import 'package:flutter/material.dart';
import '../dummyData.dart';
import '../Widgets/mealsList.dart';
import '../models/meal.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = 'CategoryMealScreen';

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String mealTitle;
  List<Meal> categorizedMeals;
  bool _isInitilized = false;

  @override
  void didChangeDependencies() {
    if (!_isInitilized) {
      final routeArguments =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final String mealId = routeArguments['id'];
      mealTitle = routeArguments['title'];
      categorizedMeals = DUMMY_MEALS.where((meal) {
        return meal.categoriesId.contains(mealId);
      }).toList();
      _isInitilized = true;
    }

    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    setState(() {
      categorizedMeals.removeWhere((element) => element.mealId == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
            removeMeal: removeMeal,
          );
        },
        itemCount: categorizedMeals.length,
      ),
    );
  }
}
