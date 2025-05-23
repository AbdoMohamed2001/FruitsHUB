import 'package:flutter/material.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/text_styles.dart';

class RatingAndReviewSection extends StatelessWidget {
  const RatingAndReviewSection({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Color(0xffFFC529)),
        const SizedBox(width: 9),
        Text(productEntity.avgRating.toStringAsFixed(2).toString(),
            style: TextStyles.textStyle13SemiBold),
        const SizedBox(width: 9),
        Text('(+${productEntity.ratingCount})',
            style: TextStyles.textStyle13SemiBold
                .copyWith(color: const Color(0xff9796A1))),
        const SizedBox(width: 9),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/rating', arguments: productEntity);
          },
          child: Text('المراجعة',
              style: TextStyles.textStyle13Bold.copyWith(
                  color: const Color(0xff1B5E37),
                  decoration: TextDecoration.underline)),
        ),
      ],
    );
  }
}
