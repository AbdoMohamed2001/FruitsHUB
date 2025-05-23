import 'package:flutter/material.dart';
import '../../../../core/entities/product_entity.dart';
import 'best_seller_item.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 0),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) => BestSellerItem(
            productEntity: products[index],
          ),
          childCount: products.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 163 / 214,
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
        ),
      ),
    );
  }
}
