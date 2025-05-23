import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/utils/functions/build_error_bar.dart';
import 'package:fruits_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';

import '../views/cart_view.dart';
import '../views/products_view.dart';
import '../views/profile_view.dart';
import 'home_view.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.currentViewIndex,
  });

  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartProductAddedSuccess) {
          showSnackBar(context, 'تم اضافة المنتج الى السلة');
        }
        if (state is CartItemRemovedSuccess) {
          showSnackBar(context, 'تم حذف المنتج من السلة');
        }
      },
      child: IndexedStack(
        index: currentViewIndex,
        children: [
          const HomeView(),
          const ProductsView(),
          const CartView(),
          const ProfileView(),
        ],
      ),
    );
  }
}
