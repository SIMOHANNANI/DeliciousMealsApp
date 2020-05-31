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
  };
  List<Meal> _mealFiltered = DUMMY_MEALS;

  void _saveFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _mealFiltered = DUMMY_MEALS.where((meal) {
        if(_filters['isGlutenFree'] && !meal.isGlutenFree) return false;
        if(_filters['isVegan'] && !meal.isVegan) return false;
        if(_filters['isLactoseFree'] &&! meal.isLactoseFree) return false;
        if(_filters['isVegetarian'] && !meal.isVegetarian) return false;
        return true;
      }).toList();
    });
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
        '/': (ctx) => Tabs(),
        CategoryMealScreen.routeName: (ctx) =>
            CategoryMealScreen(_mealFiltered),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        Filters.routeName: (ctx) => Filters(_filters,_saveFilters),
      },
    );
  }
}
