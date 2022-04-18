import 'package:flutter/material.dart';
import 'package:the_menu/models/meal.dart';
import 'package:the_menu/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favMeals;

  const FavoritesScreen({
    Key key,
    this.favMeals,
  }) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favMeals.isEmpty) {
      return Container(
        child: Center(
          child: Text('No favorites meal yet'),
        ),
      );
    } else {
      return Container(
        child: Center(
          child: ListView.builder(
            itemCount: widget.favMeals.length,
            itemBuilder: (ctx, index) {
              return MealItem(
                id: widget.favMeals[index].id,
                title: widget.favMeals[index].title,
                imageUrl: widget.favMeals[index].imageUrl,
                duration: widget.favMeals[index].duration,
                affordability: widget.favMeals[index].affordability,
                complexity: widget.favMeals[index].complexity,
              );
            },
          ),
        ),
      );
    }
  }
}
