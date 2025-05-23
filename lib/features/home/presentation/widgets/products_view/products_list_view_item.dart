import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';

import '../../../../../core/utils/text_styles.dart';

class ProductsListViewItem extends StatelessWidget {
  const ProductsListViewItem({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/product_details',
            arguments: productEntity);
      },
      child: Column(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundColor: Color(0xffF3F5F7),
            child: Image.network(
              productEntity.imageUrl!,
              fit: BoxFit.cover,
              width: 45,
              height: 45,
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            productEntity.name,
            style: TextStyles.textStyle16SemiBold,
          ),
        ],
      ),
    );
  }
}
