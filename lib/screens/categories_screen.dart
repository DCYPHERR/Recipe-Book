import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return// Scaffold(
     /* appBar: AppBar(
        title: Text(
          'DeliMeal',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),*/
     /* body:*/ GridView(
        // padding: const EdgeInsets.all(10),
        children: DUMMY_CATEGORIES
            .map(
              (catData) => Padding(
                padding: const EdgeInsets.all(10),
                child: CategoryItem(
                  color: catData.color,
                  title: catData.title,
                  id: catData.id,
                ),
              ),
            )
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          // mainAxisSpacing: 20,
        ),
      );
    //);
  }
}
