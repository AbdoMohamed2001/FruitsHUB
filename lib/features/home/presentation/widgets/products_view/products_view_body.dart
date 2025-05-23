import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/functions/custom_blured_bottom_sheet.dart';
import 'package:fruits_app/core/utils/widgets/best_seller_widget.dart';
import 'package:fruits_app/features/home/presentation/widgets/best_selling_grid_view_builder.dart';
import 'package:fruits_app/features/home/presentation/widgets/products_view/products_list_view_builder.dart';
import 'package:fruits_app/features/home/presentation/widgets/search_view/search_bar_disabled.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/utils/widgets/default_icon.dart';
import '../../../../../generated/assets.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getFeaturedProducts();
    context.read<ProductsCubit>().getBestSealingProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                //appBar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      'المنتجات',
                      style: TextStyles.textStyle19Bold,
                    ),
                    DefaultIcon(
                        icon: Icon(
                      Icons.notifications_outlined,
                      color: Color(0xff1B5E37),
                    )),
                  ],
                ),
                SizedBox(height: 16),
                //SearchBar
                DisabledSearchBar(),
                SizedBox(height: 16),
                //Products
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'منتجاتنا',
                          style: TextStyles.textStyle16Bold,
                        ),
                        GestureDetector(
                          onTap: () {
                            showBlurredBottomSheet(context);
                          },
                          child: Container(
                            width: 44,
                            height: 31,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                width: 1,
                                color: Color(0xffCACECE).withOpacity(0.4),
                              ),
                            ),
                            child:
                                Image.asset(Assets.imagesArrowSwapHorizontal),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    //productsListView
                  ],
                ),
              ],
            ),
          ),
          ProductsListViewBuilder(),
          SliverToBoxAdapter(
            child: BestSellerWidget(
              pageRouteName: '/best_sealing',
              spaceBeforeWidget: 24,
            ),
          ),
          BestSellingGridViewBuilder(),
        ],
      ),
    );
  }
}
