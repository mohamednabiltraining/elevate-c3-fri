import 'package:c3_offline/domain/model/product.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

class HorizontalProductsView extends StatelessWidget {
  List<Product> products;
  HorizontalProductsView(
  {required this.products,super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
      var product = products[index];
      return Column(
        children: [
          Image.network(product.imageCover ??""),
          Text(product.title ??"")
        ],
      );
    },
    itemCount: products.length,);
  }
}
