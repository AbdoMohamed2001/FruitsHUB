import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../../../../core/utils/text_styles.dart';
import 'counter_widget.dart';

class ProductCart extends StatelessWidget {
  const ProductCart({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.5),
      height: 92,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              //image
              Container(
                height: 92,
                width: 73,
                decoration: BoxDecoration(
                  color: Color(0xffF3F5F7),
                ),
                child: Center(
                  child: Image.network(
                    cartItemEntity.productEntity.imageUrl!,
                    width: 53,
                    height: 40,
                  ),
                ),
              ),
              SizedBox(width: 16),
              //product details
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItemEntity.productEntity.name,
                    style: TextStyles.textStyle13Bold,
                  ),
                  SizedBox(height: 2),
                  Text(
                    '${cartItemEntity.calcTotalWeight()} كجم ',
                    style: TextStyles.textStyle13Regular.copyWith(
                      color: Color(0xffF4A91F),
                      height: 160 / 100,
                    ),
                  ),
                  SizedBox(height: 6),
                  Spacer(),
                  CounterWidget(
                    product: cartItemEntity.productEntity,
                    // cartItemEntity: cartItemEntity,
                  ),
                  SizedBox(height: 2),
                ],
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  context
                      .read<CartCubit>()
                      .removeProductFromCart(cartItemEntity);
                },
                child: Icon(
                  Icons.delete_outline,
                  color: Color(0xff949D9E),
                ),
              ),
              SizedBox(height: 2),
              Text(
                '${cartItemEntity.calcTotalPrice()} ج.م ',
                style: TextStyles.textStyle16Bold.copyWith(
                  color: Color(0xffF4A91F),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
