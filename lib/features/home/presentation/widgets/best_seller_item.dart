import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/utils/functions/build_error_bar.dart';
import 'package:fruits_app/features/home/data/models/fav_product_model.dart';
import 'package:fruits_app/features/home/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../generated/assets.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/product_details',
          arguments: {
            'product': productEntity,
            'cartCubit': context.read<CartCubit>(),
          },
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
        decoration: BoxDecoration(
          color: Color(0xfff3f5f7),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Image.network(
                    productEntity.imageUrl!,
                    width: double.infinity,
                    height: 125,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Positioned(
                  top: -12,
                  right: -12,
                  child: BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      final cubit = context.watch<ProductsCubit>();
                      final productId = productEntity.docId;
                      final isProductInFavList =
                          cubit.cachedFavouriteProducts.contains(productId);
                      return IconButton(
                        onPressed: () {
                          if (isProductInFavList) {
                            cubit.removeProductFromFavourite(
                              productId: productId,
                            );
                            showSnackBar(context, 'تم إزالة المنتج من المفضلة');
                          } else {
                            var favProductModel = FavouriteProductModel(
                              docId: productEntity.docId,
                              name: productEntity.name,
                              price: productEntity.price,
                              imageUrl: productEntity.imageUrl!,
                            );
                            cubit.addProductToFavourite(
                              favProductModel: favProductModel,
                            );
                            showSnackBar(
                                context, 'تم اضافة المنتج إلي المفضلة');
                          }
                        },
                        icon: isProductInFavList
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_border_outlined,
                                color: Colors
                                    .grey, // color: context.read<FavouriteCubit>().favIconColor,
                              ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              productEntity.name,
              style: TextStyles.textStyle13SemiBold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '${productEntity.price}جنية ',
                      style: TextStyles.textStyle13Bold.copyWith(
                        color: Color(0xffF4A91F),
                      ),
                    ),
                    Text(
                      ' / الكيلو',
                      style: TextStyles.textStyle13SemiBold.copyWith(
                        color: Color(0xffF8C76D),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    context.read<CartCubit>().addProductToCart(productEntity);
                  },
                  child: CircleAvatar(
                    backgroundColor: Color(0xff1B5E37),
                    child: SvgPicture.asset(Assets.imagesPlusIcon),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
