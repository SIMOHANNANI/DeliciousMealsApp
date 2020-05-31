import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../Widgets/Drawer.dart';

class Filters extends StatefulWidget {
  static const routeName = "Settings";
  final Function handler;
  final Map<String,bool> lastFilter;

  Filters(this.lastFilter,this.handler);

  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  static var isGlutenFree = false;
  static var isVegan = false;
  static var isLactoseFree = false;
  static var isVegetarian = false;
  @override
  initState(){
    isGlutenFree = widget.lastFilter['isGlutenFree'];
    isVegan = widget.lastFilter['isVegan'];
    isLactoseFree = widget.lastFilter['isLactoseFree'];
    isVegetarian = widget.lastFilter['isVegetarian'];
    super.initState();
  }
  Widget _showListTile(
      String title, String subtitle, bool filterBy, Function handler) {
    return SwitchListTile(
      title: Text(title),
      value: filterBy,
      subtitle: Text(subtitle),
      onChanged: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: FaIcon(FontAwesomeIcons.save),
            hoverColor: Colors.white,
            onPressed: () {
              final _filters = {
                'isGlutenFree': isGlutenFree,
                'isVegan': isVegan,
                'isLactoseFree': isLactoseFree,
                'isVegetarian': isVegetarian,
              };
              widget.handler(_filters);
            },
          ),
        ],
      ),
      drawer: CustomizedDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
            child: Center(
              child: Text(
                "Adjust your preferred meals",
                style: TextStyle(
                    fontFamily:
                        Theme.of(context).textTheme.headline6.fontFamily,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _showListTile(
                  'Gluten free meals',
                  'Show only Gluten free meals',
                  isGlutenFree,
                  (newValue) {
                    setState(() {
                      isGlutenFree = newValue;
                    });
                  },
                ),
                _showListTile('Vegan  meals', 'Show only Vegan meals', isVegan,
                    (newValue) {
                  setState(() {
                    isVegan = newValue;
                  });
                }),
                _showListTile('Lactose free meals',
                    'Show only Lactose free meals', isLactoseFree, (newValue) {
                  setState(() {
                    isLactoseFree = newValue;
                  });
                }),
                _showListTile('Vegetarian meals', 'Show only Vegetarian meals',
                    isVegetarian, (newValue) {
                  setState(() {
                    isVegetarian = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
