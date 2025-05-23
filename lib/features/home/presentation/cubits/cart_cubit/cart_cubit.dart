import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/home/domain/entities/cart_entity.dart';
import 'package:fruits_app/features/home/domain/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity(
    cartItems: [],
  );

  void addProductToCart(ProductEntity productEntity) {
    try {
      CartItemEntity cartItem = cartEntity.getCartItemEntity(productEntity);
      bool isProductAlreadyInCart =
          cartEntity.isProductExistInCart(productEntity);
      if (isProductAlreadyInCart) {
        log('counter Increased');
        cartItem.increaseCount();
      } else {
        log('new item Added');
        cartEntity.cartItems.add(cartItem);
      }
      emit(CartProductAddedSuccess());
    } on Exception catch (e) {
      log('Error while trying to add product to cart in cubit $e');
      emit(CartProductAddedFailure());
    }
  }

  void removeProductFromCart(CartItemEntity cartItem) {
    try {
      cartEntity.cartItems.remove(cartItem);
      emit(CartItemRemovedSuccess());
    } on Exception catch (e) {
      log('Error while trying to remove product from cart in cubit $e');
      emit(CartItemRemovedFailure());
    }
  }

  void increaseProductCount(ProductEntity product) {
    final item = cartEntity.getCartItemEntity(product);
    if (!cartEntity.isProductExistInCart(product)) {
      cartEntity.cartItems.add(item);
    } else {
      item.increaseCount();
    }
    emit(CartItemUpdated());
  }

  void decreaseProductCount(ProductEntity product) {
    final item = cartEntity.getCartItemEntity(product);
    if (item.count > 1) {
      item.decreaseCount();
    } else {
      cartEntity.removeItemEntity(item);
    }
    emit(CartItemUpdated());
  }

  void updateUi() {
    emit(CartItemUpdated());
  }
}
