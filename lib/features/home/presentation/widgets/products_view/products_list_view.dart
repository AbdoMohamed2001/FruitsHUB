import 'package:flutter/material.dart';

import '../../../../../core/entities/product_entity.dart';
import 'products_list_view_item.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => ProductsListViewItem(
          productEntity: products[i],
        ),
        separatorBuilder: (_, i) => SizedBox(width: 9),
        itemCount: products.length,
      ),
    );
  }
}
