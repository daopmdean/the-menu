import 'package:flutter/material.dart';
import 'package:the_menu/dummy_data.dart';
import 'package:the_menu/models/meal.dart';
import 'package:the_menu/screens/categories_screen.dart';
import 'package:the_menu/screens/category_detail_screen.dart';
import 'package:the_menu/screens/filters_screen.dart';
import 'package:the_menu/screens/meal_detail_screen.dart';
import 'package:the_menu/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favMeals = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'The Menu',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(
              favMeals: _favMeals,
            ),
        CategoryDetailScreen.routeName: (ctx) =>
            CategoryDetailScreen(availableMeals: _availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(
              isFav: _isFav,
              toggleMeal: _toggleMeal,
            ),
        FiltersScreen.routeName: (ctx) => FiltersScreen(
              filters: _filters,
              setFilters: setFilters,
            ),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }

  void setFilters() {
    setState(() {
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']) {
          if (!meal.isGlutenFree) {
            return false;
          }
        }
        if (_filters['lactose']) {
          if (!meal.isLactoseFree) {
            return false;
          }
        }
        if (_filters['vegan']) {
          if (!meal.isVegan) {
            return false;
          }
        }
        if (_filters['vegetarian']) {
          if (!meal.isVegetarian) {
            return false;
          }
        }
        return true;
      }).toList();
    });
  }

  void _toggleMeal(String mealId) {
    int indexFound = _favMeals.indexWhere((meal) => meal.id == mealId);
    setState(() {
      if (indexFound >= 0) {
        _favMeals.removeAt(indexFound);
      } else {
        Meal meal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
        _favMeals.add(meal);
      }
    });
  }

  bool _isFav(String mealId) {
    return _favMeals.any((meal) => meal.id == mealId);
  }
}
