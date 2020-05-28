import 'package:flutter/material.dart';
import 'Screens/mealsGategoriesScreen.dart';
import 'Screens/CategoryMealScreen.dart';
import 'Screens/mealDetailScreen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delicious meals',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        accentColor: Colors.amberAccent,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ), //canvasColor:
      ),
      // To prevent loading the rout screen but instead the given screen[The default is '/']
      initialRoute: '/',
      routes: {
        '/': (ctx) => MealCategories(),
        CategoryMealScreen.routeName: (ctx) => CategoryMealScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
    );
  }
}
