import 'package:flutter/material.dart';

import '../../../../../core/entities/product_entity.dart';
import '../../../../../core/utils/text_styles.dart';

class RatingSummaryWidget extends StatelessWidget {
  const RatingSummaryWidget({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final Map<int, int> ratingCounts = {1: 0, 2: 0, 3: 0, 4: 0, 5: 0};

    for (var review in productEntity.reviews) {
      ratingCounts[review.rating.toInt()] = ratingCounts[review.rating]! + 1;
    }

    final totalReviews = productEntity.reviews.length;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${productEntity.reviews.length} مراجعة ',
          style: TextStyles.textStyle13Bold,
        ),
        SizedBox(height: 5),
        Align(
          alignment: Alignment.center,
          child: Text(
            'الملخص',
            style: TextStyles.textStyle16SemiBold
                .copyWith(color: Color(0xff0C0D0D)),
          ),
        ),
        SizedBox(height: 8),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Rating bars
              Expanded(
                child: Column(
                  children: List.generate(5, (index) {
                    final rating = 5 - index; // show from 5 to 1
                    final count = ratingCounts[rating]!;
                    final percent =
                        totalReviews == 0 ? 0.0 : count / totalReviews;
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 7),
                      child: Row(
                        children: [
                          Text(
                            rating.toString(),
                            style: TextStyles.textStyle13SemiBold
                                .copyWith(height: 170 / 100),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Stack(
                              children: [
                                Container(
                                  height: 8,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                FractionallySizedBox(
                                  widthFactor: percent,
                                  child: Container(
                                    height: 8,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFFB400),
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              const SizedBox(width: 22),

              // Right side: rating number, percentage and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Text(
                        productEntity.avgRating.toStringAsFixed(2).toString(),
                        style: TextStyles.textStyle13Bold,
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.star,
                        color: Color(0XFFFFB400),
                        size: 16,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "88%",
                    style: TextStyles.textStyle16Regular
                        .copyWith(height: 140 / 100),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "موصى بها",
                    style: TextStyles.textStyle13Regular
                        .copyWith(height: 160 / 100),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
