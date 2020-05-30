import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_managment_store/models/meal.dart';
import '../models/meal.dart';
import '../Screens/mealDetailScreen.dart';

class MealsList extends StatelessWidget {
  final String mealId;
  final String mealTitle;
  final String imagePath;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final Function removeMeal;

  MealsList({
    this.mealId,
    this.mealTitle,
    this.imagePath,
    this.duration,
    this.affordability,
    this.complexity,
    this.removeMeal,
  });

  // Convert the enumeration item to text :
  String get complexityToText {
    //getter
    if (complexity == Complexity.Simple) {
      return "Simple";
    } else if (complexity == Complexity.Challenging) {
      return "Challenging";
    }
    return "Hard";
  }

  String get affordabilityToText {
    if (affordability == Affordability.Affordable) {
      return "Affordable";
    } else if (affordability == Affordability.Luxurious) {
      return "Luxurious";
    }
    return "Pricey";
  }
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: mealId,
    )
        .then((value) {
      if (value != null) {
        removeMeal(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 2.5,
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            // Adding a stack to add the title above the image.
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imagePath,
                    height: 300.0,
                    width: double.infinity,
                    // Get the width that image apple to get.
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                      color: Colors.white70,
                    ),
//                    width: 200.0,  for the samllest devices
                    padding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 20.0,
                    ),
                    child: Text(
                      mealTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.schedule,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("$duration min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.work,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("$complexityToText"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(affordabilityToText),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
