import 'package:flutter/material.dart';
import '../Screens/Filters.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomizedDrawer extends StatelessWidget {
  Widget _buildListTile(
      BuildContext context, String title, IconData icon, Function onTaped) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icon,
          size: 35.0,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: Theme.of(context).textTheme.headline6.fontWeight,
          fontFamily: Theme.of(context).textTheme.headline6.fontFamily,
          fontSize: 20.0,
        ),
      ),
      onTap: onTaped,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 30.0,
      child: Container(
        color: Colors.orange,
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              height: 200.0,
              width: double.infinity,
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "Give life to your dishes",
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize:
                      Theme.of(context).textTheme.headline6.fontSize + 9.0,
                  fontWeight: Theme.of(context).textTheme.headline6.fontWeight,
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            _buildListTile(context, "Meals", FontAwesomeIcons.utensils, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            _buildListTile(context, "Filters", FontAwesomeIcons.filter, () {
              Navigator.of(context).pushReplacementNamed(Filters.routeName);
            }),
          ],
        ),
      ),
    );
  }
}
