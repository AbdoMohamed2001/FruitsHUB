import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:fruits_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:go_router/go_router.dart';
import 'product_cart_list_view.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            AppBar(
              title: Text(
                'السلة',
                style: TextStyles.textStyle19Bold,
              ),
              centerTitle: true,
              automaticallyImplyLeading: false,
            ),
            Container(
              height: 41,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffEBF9F1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'لديك ${context.watch<CartCubit>().cartEntity.cartItems.length} منتجات في سله التسوق',
                  style: TextStyles.textStyle13SemiBold,
                ),
              ),
            ),
            SizedBox(height: 24),
            CartViewListView(
              cartItems: context.watch<CartCubit>().cartEntity.cartItems,
            ),
          ],
        ),
        Positioned(
          bottom: 70,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Visibility(
              visible:
                  context.watch<CartCubit>().cartEntity.calcTotalPrice() > 0,
              child: CustomButton(
                onPressed: () {
                  context.push('/check_out');
                },
                text:
                    'الدفع  ${context.watch<CartCubit>().cartEntity.calcTotalPrice()} جنيه',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
