import 'package:flutter/material.dart';
import '../Screens/CategoryMealScreen.dart';

class CategoryItem extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;
  final Color categoryColor;

  CategoryItem(this.categoryId, this.categoryTitle, this.categoryColor);

  // We will use the routes map option in the main file to handle the navigation between screens
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: {
        'id': categoryId,
        'title': categoryTitle,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Text(
            categoryTitle,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [categoryColor.withOpacity(0.0), categoryColor.withOpacity(1)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
