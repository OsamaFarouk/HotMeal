import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../Widgets/meal_item.dart';

class FavoriteScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  FavoriteScreen(this.favoriteMeals);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favoriteMeals.isEmpty){
      return Center(
        child: Text(
          'You have no favorite meals yet!',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      );
    }else{
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: widget.favoriteMeals[index].id,
            title: widget.favoriteMeals[index].title,
            imageUrl: widget.favoriteMeals[index].imageUrl,
            duration: widget.favoriteMeals[index].duration,
            // complexity: favoriteMeals[index].complexity,
          );
        },
        itemCount: widget.favoriteMeals.length,
      );
    }

  }
}
