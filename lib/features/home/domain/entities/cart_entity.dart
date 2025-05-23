import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/home/domain/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity({required this.cartItems});
  num calcTotalPrice() {
    num totalPrice = 0;
    for (var cartItem in cartItems) {
      totalPrice += cartItem.calcTotalPrice();
    }
    return totalPrice;
  }

  addCartItemEntity(CartItemEntity cartItemEntity) {
    cartItems.add(cartItemEntity);
  }

  removeItemEntity(CartItemEntity cartItemEntity) {
    cartItems.remove(cartItemEntity);
  }

  bool isProductExistInCart(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity.code == productEntity.code) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }

  CartItemEntity getCartItemEntity(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity.code == productEntity.code) {
        return cartItem;
      }
    }
    return CartItemEntity(productEntity: productEntity, count: 1);
  }
}
