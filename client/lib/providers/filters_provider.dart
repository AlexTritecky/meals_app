import 'package:client/data/dummy_data.dart';
import 'package:client/providers/meals_provider.dart';
import 'package:client/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier(super._state) : _filters = kInitialFilters;

  Map<Filter, bool> _filters;

  Map<Filter, bool> get filters => _filters;

  void setFilter(Filter filter, bool value) {
    _filters = {
      ..._filters,
      filter: value,
    };
  }

  void setFilters(Map<Filter, bool> filters) {
    _filters = filters;
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier(
    kInitialFilters,
  );
});

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final selectedFilters = ref.watch(filtersProvider);

  final availableMeals = meals.where((meal) {
    if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();

  return availableMeals;
});
