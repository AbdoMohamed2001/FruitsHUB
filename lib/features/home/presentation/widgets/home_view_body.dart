import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';

import 'package:fruits_app/features/home/presentation/widgets/user_data.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/widgets/best_seller_widget.dart';
import 'best_selling_grid_view_builder.dart';
import 'offer_list_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProductsCubit>().getBestSealingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        //UserData
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: UserDataWidget(),
          ),
        ),
        //OfferListView
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: OfferListView(),
          ),
        ),
        //BestSellerWidget
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: BestSellerWidget(
              pageRouteName: '/best_sealing',
              spaceBeforeWidget: 12,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          sliver: BestSellingGridViewBuilder(),
        ),
      ],
    );
  }
}
