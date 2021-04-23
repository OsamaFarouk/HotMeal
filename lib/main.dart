import 'package:flutter/material.dart';
import 'package:meals_app/Screens/category_meals_screen.dart';
import 'package:meals_app/Screens/filters_screen.dart';
import 'package:meals_app/Screens/tabs_screen.dart';
import 'package:meals_app/dummy_data.dart';
import 'Screens/categories_screen.dart';
import 'Screens/meal_detail_screen.dart';
import './models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        favoritedMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoritedMeals.removeAt(existingIndex);
      });
    } else {
      favoritedMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
    }
  }
  bool isFavoriteMeal(String id){
    return favoritedMeals.any((meal)  => meal.id==id);
  }

  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoritedMeals = [];

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(20, 51, 51, 1),
                    fontSize: 25,
                    fontFamily: 'RobotoCondensed'),
              )),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(favoritedMeals),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(toggleFavorite,isFavoriteMeal),
        FiltersScreen.routeName: (ctx) => FiltersScreen(filters, setFilters),
      },
    );
  }
}
