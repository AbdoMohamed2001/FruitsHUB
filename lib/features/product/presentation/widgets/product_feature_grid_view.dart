import 'package:flutter/material.dart';
import 'package:fruits_app/features/product/presentation/widgets/product_grid_item.dart';

import '../../../../core/entities/product_entity.dart';
import '../../domain/entities/product_grid_entity.dart';

class ProductFeaturesGridViewSection extends StatelessWidget {
  const ProductFeaturesGridViewSection({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 4,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: 28.5 / 12,
      ),
      itemBuilder: (_, i) => ProductGridItem(
        productGridEntity:
            ProductGridEntity.getProductGridList(productEntity)[i],
      ),
    );
  }
}
