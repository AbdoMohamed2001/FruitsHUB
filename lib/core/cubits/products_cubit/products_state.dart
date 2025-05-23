part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsFailure extends ProductsState {
  final String message;
  ProductsFailure(this.message);
}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> products;
  ProductsSuccess(this.products);
}

//--------------------------------------------------------
final class ProductFavouriteLoading extends ProductsState {}

final class ProductFavouriteSuccess extends ProductsState {}

final class ProductFavouriteFailure extends ProductsState {
  final String message;
  ProductFavouriteFailure(this.message);
}

//----------------------------------------------------------
class ProductsFavouriteListUpdated extends ProductsState {
  final List<String> favIds;
  ProductsFavouriteListUpdated(this.favIds);
}
