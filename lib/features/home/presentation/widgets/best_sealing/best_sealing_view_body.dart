import 'package:flutter/material.dart';

import '../../../../../core/utils/text_styles.dart';
import '../best_selling_grid_view_builder.dart';

class BestSealingViewBody extends StatelessWidget {
  const BestSealingViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24),
                Text(
                  'الأكثر مبيعًا',
                  style: TextStyles.textStyle16Bold,
                ),
              ],
            ),
          ),
        ),
        BestSellingGridViewBuilder(),
      ],
    );
  }
}
