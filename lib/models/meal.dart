import 'package:flutter/foundation.dart';

enum  Complexity {
  Simple,
  Medium,
  Hard,
}
enum Affordability {
  Affordable,
  Pricey,
  Luxurious,
}

class  Meal {
  final List<String> categories;
  final List<String> component;
  final List<String> steps;
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final bool isGlutenFree;
  final bool isFavorite;

  const Meal({
    @required this.affordability,
    @required this.title,
    @required this.id,
    @required this.categories,
    @required this.complexity,
    @required this.component,
    @required this.duration,
    @required this.imageUrl,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.steps,
    @required this.isFavorite,
  });
}