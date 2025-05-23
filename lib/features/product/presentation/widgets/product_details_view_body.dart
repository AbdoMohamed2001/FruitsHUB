import 'package:flutter/material.dart';
import 'package:fruits_app/features/product/presentation/widgets/image_cart.dart';
import 'package:fruits_app/features/product/presentation/widgets/product_feature_grid_view.dart';
import 'package:fruits_app/features/product/presentation/widgets/rating_review_section.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/text_styles.dart';
import 'name_price_section.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCard(image: productEntity.imageUrl!),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                NameAndPriceSection(productEntity: productEntity),
                const SizedBox(height: 8),
                RatingAndReviewSection(productEntity: productEntity),
                const SizedBox(height: 8),
                Text(
                  productEntity.description,
                  style: TextStyles.textStyle13Regular.copyWith(
                    color: const Color(0xff979899),
                  ),
                  maxLines: 7,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                ProductFeaturesGridViewSection(productEntity: productEntity),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
