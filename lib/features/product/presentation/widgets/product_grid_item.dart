import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/features/product/domain/entities/product_grid_entity.dart';

import '../../../../core/utils/text_styles.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({super.key, required this.productGridEntity});
  final ProductGridEntity productGridEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          width: 1,
          color: Color(0xffF1F1F5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productGridEntity.title,
                style: TextStyles.textStyle16Bold.copyWith(
                  color: Color(0xff23AA49),
                ),
              ),
              SizedBox(height: 4),
              Text(
                productGridEntity.subTitle,
                style: TextStyles.textStyle13SemiBold.copyWith(
                  color: Color(0xff979899),
                  height: 170 / 100,
                ),
              ),
            ],
          ),
          SizedBox(width: 18),
          SvgPicture.asset(
            productGridEntity.image,
          ),
        ],
      ),
    );
  }
}
