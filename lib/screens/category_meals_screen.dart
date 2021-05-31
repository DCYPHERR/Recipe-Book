import 'package:flutter/material.dart';
import '../data.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';
// import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const route = '/selectedCategory';
  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayMeals;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      Map arguments = ModalRoute.of(context).settings.arguments;
      final categoryId = arguments['id'];
      categoryTitle = arguments['title'];
      displayMeals = widget.availableMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _loadedInitData = true;
    }

    super.didChangeDependencies();
  }

  
  @override
  Widget build(BuildContext context) {
    print('category meals');
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemCount: displayMeals.length,
        itemBuilder: (context, index) {
          return MealItem(
            id: displayMeals[index].id,
            title: displayMeals[index].title,
            imageUrl: displayMeals[index].imageURL,
            duration: displayMeals[index].duration,
            complexity: displayMeals[index].complexity,
            affordability: displayMeals[index].affordability,
            // removeItem: _removeMeal,
          );
        },
      ),
    );
  }
}
