import 'package:flutter/material.dart';
import 'package:the_menu/models/meal.dart';
import 'package:the_menu/widgets/meal_item.dart';

class CategoryDetailScreen extends StatefulWidget {
  static const routeName = '/categoryDetail';

  final List<Meal> availableMeals;

  const CategoryDetailScreen({
    Key key,
    this.availableMeals,
  }) : super(key: key);

  @override
  _CategoryDetailScreenState createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  String categoryTitle;
  List<Meal> categoryMeals;
  var init = false;

  @override
  void didChangeDependencies() {
    if (!init) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = args['id'];
      categoryTitle = args['title'];
      categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      init = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
            );
          },
        ),
      ),
    );
  }
}
