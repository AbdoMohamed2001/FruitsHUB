import 'package:dartz/dartz.dart';
import '../../../features/home/data/models/fav_product_model.dart';
import '../../entities/product_entity.dart';
import '../../errors/failure.dart';

abstract class ProductRepo {
  //GET
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, ProductEntity>> getProduct({
    required String recordId,
  });
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
  Future<Either<Failure, List<ProductEntity>>> getFeaturedProducts();
  Future<Either<Failure, List<ProductEntity>>> getUserFavouriteProducts();

  //ADD
  Future<Either<Failure, void>> addProductToFavourite({
    required FavouriteProductModel favProductModel,
  });

  Future<Either<Failure, void>> removeProductFromFavourite({
    required String productId,
  });
}
