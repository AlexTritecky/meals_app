import 'package:client/data/dummy_data.dart';
import 'package:client/models/category.dart';
import 'package:client/screens/meals.dart';
import 'package:client/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = dummyMeals.where((meal) {
      return meal.categories.contains(category.id);
    }).toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: '${category.title} meals',
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pick your category'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
          children: [
            for (final category in availableCategories)
              CategoryGridItem(
                  category: category,
                  onSelectCategory: () {
                    _selectedCategory(context, category);
                  }),
          ],
        ));
  }
}
