import 'package:flutter/material.dart';
import '../dummyData.dart';
import '../Widgets/Category_item.dart';

class MealCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(20.0),
        children: DUMMY_CATEGORIES
            .map((categoryItem) =>
            CategoryItem(
              categoryItem.id,
              categoryItem.title,
              categoryItem.color,
            ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20.0,
            mainAxisSpacing: 10.0),
      );
  }
}
