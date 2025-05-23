import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/product/presentation/widgets/product_details_view_body.dart';

import '../../../../core/utils/widgets/custom_button.dart';
import '../../../home/presentation/cubits/cart_cubit/cart_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        child: CustomButton(
          onPressed: () {
            context.read<CartCubit>().addProductToCart(productEntity);
          },
          text: 'أضف الي السلة',
        ),
      ),
      body: ProductDetailsViewBody(
        productEntity: productEntity,
      ),
    );
  }
}
