import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/cart_view/product_cart.dart';

class CartViewListView extends StatelessWidget {
  const CartViewListView({super.key, required this.cartItems});
  final List<CartItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (_, i) => ProductCart(
          cartItemEntity: cartItems[i],
        ),
        separatorBuilder: (_, i) => Divider(),
        itemCount: cartItems.length,
      ),
    );
  }
}
