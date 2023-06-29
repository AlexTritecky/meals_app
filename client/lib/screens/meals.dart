import 'package:client/models/meal.dart';
import 'package:client/widgets/meal_item.dart';
import 'package:flutter/material.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(meal: meals[index]);
      },
    );

    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No meals found',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          const SizedBox(height: 16),
          Text('Try changing your filters',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  )),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go back'),
          ),
        ],
      ));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
