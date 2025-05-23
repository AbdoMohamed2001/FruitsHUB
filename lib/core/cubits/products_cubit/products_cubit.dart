import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/repos/products_repos/product_repo.dart';
import 'package:meta/meta.dart';

import '../../../features/home/data/models/fav_product_model.dart';
import '../../services/shared_prefs_services.dart';
import '../../utils/constants.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());

  final ProductRepo productRepo;
  List<String> cachedFavouriteProducts = [];
  List<ProductEntity> allProducts = [];
  List<ProductEntity> bestSellingProducts = [];
  List<ProductEntity> featuredProducts = [];

  loadCachedFavourites() {
    cachedFavouriteProducts = Prefs.getStringList(kFavProductIds) ?? [];
    log('this is cached products $cachedFavouriteProducts');
  }

//GET
  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts();
    result.fold((l) => emit(ProductsFailure(l.message)), (products) {
      allProducts = products;
      emit(ProductsSuccess(products));
    });
  }

  Future<void> getBestSealingProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold((l) => emit(ProductsFailure(l.message)), (products) {
      bestSellingProducts = products;
      emit(ProductsSuccess(products));
    });
  }

  Future<void> getFeaturedProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getFeaturedProducts();
    result.fold((l) => emit(ProductsFailure(l.message)), (products) {
      featuredProducts = products;
      emit(ProductsSuccess(products));
    });
  }

  Future<void> getUserFavouriteProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getUserFavouriteProducts();
    result.fold((l) => emit(ProductsFailure(l.message)), (products) {
      emit(ProductsSuccess(products));
    });
  }

  //ADD

  addProductToFavourite({
    required FavouriteProductModel favProductModel,
  }) async {
    emit(ProductFavouriteLoading());
    // 1 - Add to Firebase
    var result = await productRepo.addProductToFavourite(
        favProductModel: favProductModel);
    // 2 - Cache The product in product List
    cacheFavouriteProduct(favProductModel.docId);
    result.fold(
      (failure) {
        emit(ProductFavouriteFailure(failure.message));
      },
      (success) {
        emit(ProductFavouriteSuccess());
      },
    );
  }

  Future<void> cacheFavouriteProduct(String productId) async {
    try {
      final List<String> favourites = Prefs.getStringList(kFavProductIds) ?? [];
      if (!favourites.contains(productId)) {
        favourites.add(productId);
        Prefs.setStringList(kFavProductIds, favourites);
        cachedFavouriteProducts = favourites;
      }
    } catch (e) {
      throw Exception('Failed to cache favourite product: $e');
    }
  }

//REMOVE
  void removeProductFromFavourite({
    required String productId,
  }) async {
    emit(ProductFavouriteLoading());
    final result =
        await productRepo.removeProductFromFavourite(productId: productId);
    removeCachedFavouriteProduct(productId);
    loadCachedFavourites();
    result.fold((failure) {
      emit(ProductFavouriteFailure(failure.message));
    }, (success) {
      emit(ProductsFavouriteListUpdated(cachedFavouriteProducts));
      emit(ProductFavouriteSuccess());
    });
  }

  Future<void> removeCachedFavouriteProduct(String productId) async {
    try {
      final List<String> favourites = Prefs.getStringList(kFavProductIds) ?? [];
      if (favourites.contains(productId)) {
        favourites.remove(productId);
        await Prefs.setStringList(kFavProductIds, favourites);
        cachedFavouriteProducts = favourites;
      }
    } catch (e) {
      throw Exception('Failed to cache favourite product: $e');
    }
  }

//UPDATE
}
