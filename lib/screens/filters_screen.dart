import 'package:flutter/material.dart';
import 'package:the_menu/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Map<String, bool> filters;
  final Function setFilters;

  const FiltersScreen({
    Key key,
    this.filters,
    this.setFilters,
  }) : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
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
      widget.filters['gluten'] = value;
      widget.setFilters();
    });
  }

  void _updateVegan(bool value) {
    setState(() {
      widget.filters['vegan'] = value;
      widget.setFilters();
    });
  }

  void _updateVegetarian(bool value) {
    setState(() {
      widget.filters['vegetarian'] = value;
      widget.setFilters();
    });
  }

  void _updateLactoseFree(bool value) {
    setState(() {
      widget.filters['lactose'] = value;
      widget.setFilters();
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
                widget.filters['gluten'],
                _updateGlutenFree,
              ),
              _buildSwitch(
                'Vegan',
                'Only Vegan meals',
                widget.filters['vegan'],
                _updateVegan,
              ),
              _buildSwitch(
                'Vegetarian',
                'Only Vegetarian meals',
                widget.filters['vegetarian'],
                _updateVegetarian,
              ),
              _buildSwitch(
                'Lactose-free',
                'Only lactose-free meals',
                widget.filters['lactose'],
                _updateLactoseFree,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
