import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';
  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.network(
                  selectMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
                height: 300,
                width: double.infinity,
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    'Components',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black38),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      Card(
                        color: Colors.black38,
                        child: Text(
                          selectMeal.component[index],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectMeal.component.length,
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Text(
                    'Steps',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 200,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('${index + 1}'),
                        ),
                        title: Text(selectMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectMeal.steps.length,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId) ? Icons.star : Icons.star_border,
        ),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
