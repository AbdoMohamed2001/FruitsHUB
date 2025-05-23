import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/errors/failure.dart';
import 'package:fruits_app/core/models/product_model.dart';
import 'package:fruits_app/core/repos/products_repos/product_repo.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:fruits_app/core/utils/backend_endpoints.dart';
import 'package:fruits_app/core/utils/functions/getCachedUserData.dart';
import 'package:fruits_app/features/home/data/models/fav_product_model.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseServices databaseServices;

  ProductRepoImpl({required this.databaseServices});

  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.productsCollection,
        query: {
          'limit': 10,
          'orderBy': 'salesCount',
          'descending': true,
        },
      ) as List<Map<String, dynamic>>;
      List<ProductModel> productsModels =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> products =
          productsModels.map((model) => model.toEntity()).toList();
      return right(products);
    } catch (e) {
      log('there is error in getBestSellingProducts in products repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getFeaturedProducts() async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.productsCollection,
        query: {
          'where': 'isFeatured',
          'orderBy': 'salesCount',
        },
      ) as List<Map<String, dynamic>>;
      List<ProductModel> productsModels =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> products =
          productsModels.map((model) => model.toEntity()).toList();
      return right(products);
    } catch (e) {
      log('there is error in getBestSellingProducts in products repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseServices.getData(
              path: BackEndEndPoints.productsCollection)
          as List<Map<String, dynamic>>;
      List<ProductModel> productsModels =
          data.map((e) => ProductModel.fromJson(e)).toList();
      List<ProductEntity> products =
          productsModels.map((model) => model.toEntity()).toList();
      log('there is the length of products ${products.length}');
      return right(products);
    } catch (e) {
      log('there is error in getProducts in products repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }

  @override
  Future<Either<Failure, ProductEntity>> getProduct({
    required String recordId,
  }) async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.productsCollection,
        recordId: recordId,
      ) as Map<String, dynamic>;
      ProductModel productModel = ProductModel.fromJson(data);
      ProductEntity product = productModel.toEntity();
      return right(product);
    } catch (e) {
      log('there is error in getProduct in products repo impl $e');
      return left(ServerFailure(message: 'There is error while getting data!'));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>>
      getUserFavouriteProducts() async {
    try {
      var data = await databaseServices.getData(
        path: BackEndEndPoints.userCollection,
        subPath: BackEndEndPoints.userFavouriteCollection,
        subRecordId: getCachedUserData().id,
      ) as List<Map<String, dynamic>>;
      //get favourite product model
      List<FavouriteProductModel> favouriteProductModels =
          data.map((e) => FavouriteProductModel.fromJson(e)).toList();
      //convert to product entity
      List<ProductEntity> products =
          await FavouriteProductModel.toProductEntityList(
              favouriteProductModels);
      return right(products);
    } catch (e) {
      log('there is error in getFavouriteData in products repo impl $e');
      return left(ServerFailure(message: 'حدث خطأ ما'));
    }
  }

  @override
  Future<Either<Failure, void>> addProductToFavourite({
    required FavouriteProductModel favProductModel,
  }) async {
    try {
      await databaseServices.addData(
        path: BackEndEndPoints.userCollection,
        recordId: getCachedUserData().id,
        subPath: BackEndEndPoints.userFavouriteCollection,
        subRecordId: favProductModel.docId,
        data: favProductModel.toJson(),
      );
      return right(null);
    } on Exception catch (e) {
      log('there is error in addProductToFavourite in products repo impl $e');
      return left(ServerFailure(message: 'There is error while adding data!'));
    }
  }

  @override
  Future<Either<Failure, void>> removeProductFromFavourite({
    required String productId,
  }) async {
    try {
      await databaseServices.removeData(
        path: BackEndEndPoints.userCollection,
        recordId: getCachedUserData().id,
        subPath: BackEndEndPoints.userFavouriteCollection,
        subRecordId: productId,
      );
      return right(null);
    } on Exception catch (e) {
      log('there is error in removeProductFromFavourite in products repo impl $e');
      return left(
          ServerFailure(message: 'There is error while removing data!'));
    }
  }
}
