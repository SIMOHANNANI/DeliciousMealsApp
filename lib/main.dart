import 'package:flutter/material.dart';
import 'package:meals_managment_store/dummyData.dart';
import 'Screens/CategoryMealScreen.dart';
import 'Screens/mealDetailScreen.dart';
import 'Screens/tabsScreen.dart';
import 'Screens/Filters.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'isGlutenFree': false,
    'isVegan': false,
    'isLactoseFree': false,
    'isVegetarian': false,
    'isFavorite': false,
  };
  List<Meal> _mealFiltered = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  void _saveFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _mealFiltered = DUMMY_MEALS.where((meal) {
        if (_filters['isGlutenFree'] && !meal.isGlutenFree) return false;
        if (_filters['isVegan'] && !meal.isVegan) return false;
        if (_filters['isLactoseFree'] && !meal.isLactoseFree) return false;
        if (_filters['isVegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
  }

  void turnToFavorite(String mealId) {
    final existed = _favoriteMeals.indexWhere((meal) => mealId == meal.mealId);
    // We'll get -1 when the meal is not presend in the favorite list ,then add it to that list
    // otherwise ,when getting an index we know that we should remove that meal from the given index .
    if (existed == -1) {
      // If the meal doesn't exist .. then add it
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.mealId == mealId),
        );
      });
    } else {
      // If the meal exist then remove it from  that index.
      setState(() {
        _favoriteMeals.removeAt(existed);
      });
    }
  }
  bool _isFavoriteMeal(String mealId){
   return  true;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delicious meals',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.amberAccent,
        primaryColorLight: Colors.white,
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
        '/': (ctx) => Tabs(_favoriteMeals),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_mealFiltered),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(turnToFavorite,_isFavoriteMeal),
        Filters.routeName: (ctx) => Filters(_filters, _saveFilters),
      },
    );
  }
}
