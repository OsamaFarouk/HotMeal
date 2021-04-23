import 'package:flutter/material.dart';
import 'package:meals_app/Screens/categories_screen.dart';
import 'package:meals_app/Screens/favorite_screen.dart';
import 'package:meals_app/Widgets/main_drawer.dart';
import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;
  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> pages;
  int selectedPageIndex = 0;
@override
  void initState() {
   pages = [
     {'page': CategoriesScreen(), 'title': 'Categories'},
     {'page': FavoriteScreen(widget.favoriteMeals), 'title': 'Favorites'},
   ];
    super.initState();
  }
  void selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(
          pages[selectedPageIndex]['title'],
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Raleway'),
        ),
      ),
      body: pages[selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectedPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        selectedFontSize: 15,
        currentIndex: selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('Categories'),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text('Favorites'),
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
