import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/widgets/cart_view/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CartViewBody(),
    );
  }
}
