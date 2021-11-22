import 'package:flutter/material.dart';
import 'package:the_menu/screens/categories_screen.dart';
import 'package:the_menu/screens/category_detail_screen.dart';
import 'package:the_menu/screens/meal_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
        '/': (ctx) => CategoriesScreen(),
        CategoryDetailScreen.routeName: (ctx) => CategoryDetailScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
