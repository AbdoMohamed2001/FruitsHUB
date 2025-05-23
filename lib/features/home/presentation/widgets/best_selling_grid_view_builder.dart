import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/utils/functions/get_dummy_products.dart';
import 'best_selling_grid_view.dart';

class BestSellingGridViewBuilder extends StatelessWidget {
  final Stream<List<ProductEntity>>? stream;

  const BestSellingGridViewBuilder({
    super.key,
    this.stream,
  });

  @override
  Widget build(BuildContext context) {
    if (stream != null) {
      return StreamBuilder<List<ProductEntity>>(
        stream: stream!,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeletonizer.sliver(
              enabled: true,
              child: BestSellingGridView(
                products: getDummyProducts(),
              ),
            );
          } else if (snapshot.hasError) {
            return SliverToBoxAdapter(
              child: Center(child: Text("Error loading products")),
            );
          }

          final products = snapshot.data ?? [];

          return BestSellingGridView(products: products);
        },
      );
    } else {
      return BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          final cubit = context.read<ProductsCubit>();
          final List<ProductEntity> products = cubit.bestSellingProducts;
          if (state is ProductsLoading) {
            return Skeletonizer.sliver(
              enabled: true,
              child: BestSellingGridView(
                products: getDummyProducts(),
              ),
            );
          } else if (state is ProductsFailure) {
            return SliverToBoxAdapter(
              child: Center(child: Text(state.message)),
            );
          }
          return BestSellingGridView(products: products);
        },
      );
    }
  }
}
