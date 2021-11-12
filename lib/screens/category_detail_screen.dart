import 'package:flutter/material.dart';

class CategoryDetailScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  const CategoryDetailScreen({
    Key key,
    this.categoryId,
    this.categoryTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
