import 'package:flutter/material.dart';
import '../Widgets/Drawer.dart';
class Filters extends StatelessWidget{
  static const routeName = "Settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your filters"),
        backgroundColor: Colors.red,
      ),
      drawer: CustomizedDrawer(),
    ) ;
  }
}