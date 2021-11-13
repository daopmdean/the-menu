import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  static const routeName = '/categoryDetail';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = args['id'];
    final categoryTitle = args['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'The Recipes For The Category!',
        ),
      ),
    );
  }
}
