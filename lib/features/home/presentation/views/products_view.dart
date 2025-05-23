import 'package:flutter/material.dart';
import 'package:fruits_app/features/home/presentation/widgets/products_view/products_view_body.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: ProductsViewBody()),
    );
  }
}
