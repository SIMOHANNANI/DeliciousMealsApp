import 'package:flutter/material.dart';
import './mealsGategoriesScreen.dart';
import './FavoritesScreen.dart';
import '../Widgets/Drawer.dart';
import '../models/meal.dart';

class Tabs extends StatefulWidget {
  final List<Meal> _favoriteMeals;
  Tabs(this._favoriteMeals);
  @override
  _TabsState createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  List<Widget> _bottomTabs ;
  int _selectedTabIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }
  @override
  void initState() {
    _bottomTabs = [
      MealCategories(),
      Favorites(widget._favoriteMeals),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Center(
                child: _selectedTabIndex == 0
                    ? Text(
                        'Delicious meals categories',
                        style: TextStyle(fontFamily: 'Raleway'),
                      )
                    : Text(
                        'Favorite meals',
                        style: TextStyle(fontFamily: 'Raleway'),
                      )),
          ),
          drawer: CustomizedDrawer(),
          body: _bottomTabs[_selectedTabIndex],
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Theme.of(context).primaryColor,
              unselectedItemColor: Theme.of(context).primaryColorLight,
              selectedItemColor: Colors.black,
              currentIndex: _selectedTabIndex,
              onTap: _selectedTab,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  title: Text("Categories"),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text("Favorites"),
                )
              ])),
    );
  }
}
