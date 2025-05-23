import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';

import '../text_styles.dart';

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({
    super.key,
    required this.pageRouteName,
    required this.spaceBeforeWidget,
    this.spaceAfter = 8,
  });

  final String pageRouteName;
  final double spaceBeforeWidget;
  final double? spaceAfter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: spaceBeforeWidget),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'الأكثر مبيعًا',
              style: TextStyles.textStyle16Bold,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  pageRouteName,
                  arguments: context.read<ProductsCubit>(),
                );
              },
              child: Text(
                'المزيد',
                style: TextStyles.textStyle13Regular.copyWith(
                  color: Color(0xff949D9E),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: spaceAfter),
      ],
    );
  }
}
