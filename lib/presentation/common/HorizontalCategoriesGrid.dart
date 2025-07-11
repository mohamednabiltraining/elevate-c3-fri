import 'package:c3_offline/domain/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HorizontalCategoriesGrid extends StatelessWidget {
  List<Category> categories;
  HorizontalCategoriesGrid(
      {required this.categories,super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        childAspectRatio: 1
      ),
      itemBuilder: (context, index) {
      var category = categories[index];
      return Column(
        children: [
          Image.network(category.image ??""),
          Text(category.name ??"")
        ],
      );
    },
    itemCount: categories.length,);
  }
}
