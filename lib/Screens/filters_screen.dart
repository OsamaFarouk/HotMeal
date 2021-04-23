import 'package:flutter/material.dart';
import 'package:meals_app/Widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilter;
  final Map<String,bool> currentFilter;


  FiltersScreen(this.currentFilter,this.saveFilter);

  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var glutenFree = false;

  var vegetarianFree = false;

  var vegan = false;

  var lactoseFree = false;
@override
  initState(){
  glutenFree = widget.currentFilter['gluten'];
  vegetarianFree = widget.currentFilter['vegetarian'];
  vegan = widget.currentFilter['vegan'];
  lactoseFree = widget.currentFilter['lactose'];


  super.initState();
  }


  Widget buildSwitchListTile(
      String title, String description, bool current, Function value) {
    return SwitchListTile(
        title: Text(title),
        subtitle: Text(description),
        value: current,
        onChanged: value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(icon: Icon(Icons.save), onPressed: (){
              final selectedFilters = {
                'gluten': glutenFree,
                'lactose': lactoseFree,
                'vegan': vegan,
                'vegetarian': vegetarianFree,
              };
              widget.saveFilter(selectedFilters);
            })
          ],
        ),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust your meal section, then \n press save icon',
                style: Theme.of(context).textTheme.title,
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  buildSwitchListTile(
                      "Gluten Free",
                      "Only contains Gluten Free meals.",
                      glutenFree, (newValue) {
                    setState(() {
                      glutenFree = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      "vegetarian Free",
                      "Only contains vegetarian Free meals.",
                      vegetarianFree, (newValue) {
                    setState(() {
                      vegetarianFree = newValue;
                    });
                  }),
                  buildSwitchListTile("vegan", "Only vegan meals.", vegan,
                      (newValue) {
                    setState(() {
                      vegan = newValue;
                    });
                  }),
                  buildSwitchListTile(
                      "lactose Free",
                      "Only contains lactose Free meals.",
                      lactoseFree, (newValue) {
                    setState(() {
                      lactoseFree = newValue;
                    });
                  }),
                ],
              ),

            ),
          ],
        ));
  }
}
