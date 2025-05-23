import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../../../../core/entities/product_entity.dart';
import '../../../../../core/utils/text_styles.dart';
import 'counter_icon.dart';

class CounterWidget extends StatelessWidget {
  final ProductEntity product;

  const CounterWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartCubit = context.watch<CartCubit>();
    final cartItem = cartCubit.cartEntity.cartItems.firstWhere(
      (item) => item.productEntity.code == product.code,
      orElse: () => CartItemEntity(productEntity: product, count: 0),
    );

    if (cartItem.count == 0) {
      return ElevatedButton(
        onPressed: () {
          cartCubit.addProductToCart(product);
        },
        child: Text("إضف إلي السله"),
      );
    }

    return SizedBox(
      width: 120,
      child: Row(
        children: [
          CounterIcon(
            backgroundColor: const Color(0xff1B5E37),
            onTap: () {
              cartCubit.increaseProductCount(product);
            },
            icon: const Icon(Icons.add, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '${cartItem.count}',
              style: TextStyles.textStyle16Bold,
            ),
          ),
          CounterIcon(
            backgroundColor: const Color(0xffF3F5F7),
            onTap: () {
              cartCubit.decreaseProductCount(product);
            },
            icon: const Icon(Icons.remove, color: Color(0xff979899)),
          ),
        ],
      ),
    );
  }
}
