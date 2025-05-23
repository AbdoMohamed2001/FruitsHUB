import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/utils/widgets/custom_app_bar.dart';
import 'package:fruits_app/features/home/presentation/widgets/rating_view/rating_view_body.dart';

class RatingView extends StatelessWidget {
  const RatingView({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'المراجعه'),
      body: RatingViewBody(
        productEntity: productEntity,
      ),
    );
  }
}
