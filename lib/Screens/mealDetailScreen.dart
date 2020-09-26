import 'package:flutter/material.dart';
import '../dummyData.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = 'MealDetailScreen';
  final Function turnToFavorite;
  final Function _isFavoriteMeal;

  MealDetailScreen(this.turnToFavorite, this._isFavoriteMeal);

  Widget titleSectionHandler(BuildContext context, String text) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final targetedMeal =
        DUMMY_MEALS.firstWhere((meal) => meal.mealId == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(targetedMeal.mealTitle),
      ),
      body: SingleChildScrollView(
        child: Card(
          shadowColor: Colors.red,
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                height: 400.0,
                child: Image.network(
                  targetedMeal.imagePath,
                  fit: BoxFit.fitWidth,
                ),
              ),
              titleSectionHandler(context, "Ingredient :"),
              Container(
                height: 400.0,
                width: 400.0,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            title: Text(
                              "${targetedMeal.mealIngredients[index]}",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: targetedMeal.mealIngredients.length,
                ),
              ),
              titleSectionHandler(context, "Steps :"),
              Container(
                height: 400.0,
                width: 400.0,
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    return Container(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                            title: Text(
                              "${targetedMeal.steps[index]}",
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: targetedMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: FaIcon(
          _isFavoriteMeal(mealId)
              ? FontAwesomeIcons.heart
              : FontAwesomeIcons.heartBroken,
          color: Colors.black,
        ),
        onPressed: ()=>turnToFavorite(mealId),
      ),
    );
  }
}
