import 'package:flutter/material.dart';
import './mealsGategoriesScreen.dart';
import './FavoritesScreen.dart';
import '../Widgets/Drawer.dart';

class Tabs extends StatefulWidget {
  @override
  _TabsState createState() {
    return _TabsState();
  }
}

class _TabsState extends State<Tabs> {
  final List<Widget> _bottomTabs = [
    MealCategories(),
    Favorites(),
  ];
  int _selectedTabIndex = 0;

  void _selectedTab(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
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
          endDrawer: CustomizedDrawer(),
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
