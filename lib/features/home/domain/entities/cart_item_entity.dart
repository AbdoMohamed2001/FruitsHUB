import 'package:equatable/equatable.dart';
import 'package:fruits_app/core/entities/product_entity.dart';

class CartItemEntity extends Equatable {
  final ProductEntity productEntity;
  num count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calcTotalPrice() {
    return productEntity.price * count;
  }

  num calcTotalWeight() {
    return 1 * count;
  }

  void increaseCount() {
    count++;
  }

  void decreaseCount() {
    count--;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [productEntity];
}
