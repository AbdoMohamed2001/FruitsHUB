import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_app/core/utils/functions/get_dummy_products.dart';
import 'package:fruits_app/features/home/presentation/widgets/products_view/products_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/entities/product_entity.dart';

class ProductsListViewBuilder extends StatelessWidget {
  const ProductsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();
        final List<ProductEntity> products = cubit.featuredProducts;
        if (state is ProductsLoading) {
          return Skeletonizer.sliver(
              child: SliverToBoxAdapter(
            child: ProductsListView(
              products: getDummyProducts(),
            ),
          ));
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(child: Text(state.message)),
          );
        }
        return SliverToBoxAdapter(
          child: ProductsListView(
            products: products,
          ),
        );
      },
    );
  }
}
