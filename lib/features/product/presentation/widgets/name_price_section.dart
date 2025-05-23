import 'package:flutter/material.dart';

import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../home/domain/entities/cart_item_entity.dart';
import '../../../home/presentation/widgets/cart_view/counter_widget.dart';

class NameAndPriceSection extends StatelessWidget {
  const NameAndPriceSection({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productEntity.name, style: TextStyles.textStyle16Bold),
            const SizedBox(height: 4),
            Row(
              children: [
                Text('${productEntity.price} جنيه ',
                    style: TextStyles.textStyle13SemiBold
                        .copyWith(color: const Color(0xffF4A91F))),
                Text('/ الكيلو',
                    style: TextStyles.textStyle13SemiBold
                        .copyWith(color: const Color(0xffF4A91F))),
              ],
            ),
          ],
        ),
        CounterWidget(
          product: productEntity,
        ),
      ],
    );
  }
}
