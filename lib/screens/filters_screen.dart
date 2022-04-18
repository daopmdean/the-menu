import 'package:flutter/material.dart';
import 'package:the_menu/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _vegetarian = false;
  bool _lactoseFree = false;

  Widget _buildSwitch(
    String title,
    String subTitle,
    bool value,
    Function onChanged,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: onChanged,
    );
  }

  void _updateGlutenFree(bool value) {
    setState(() {
      _glutenFree = value;
    });
  }

  void _updateVegan(bool value) {
    setState(() {
      _vegan = value;
    });
  }

  void _updateVegetarian(bool value) {
    setState(() {
      _vegetarian = value;
    });
  }

  void _updateLactoseFree(bool value) {
    setState(() {
      _lactoseFree = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Text('Filters'),
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _buildSwitch(
                'Gluten-free',
                'Only gluten-free meals',
                _glutenFree,
                _updateGlutenFree,
              ),
              _buildSwitch(
                'Vegan',
                'Only Vegan meals',
                _vegan,
                _updateVegan,
              ),
              _buildSwitch(
                'Vegetarian',
                'Only Vegetarian meals',
                _vegetarian,
                _updateVegetarian,
              ),
              _buildSwitch(
                'Gluten-free',
                'Only gluten-free meals',
                _lactoseFree,
                _updateLactoseFree,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
