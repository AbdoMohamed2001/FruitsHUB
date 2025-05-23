import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/product_entity.dart';
import '../../../../../core/models/product_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.dataBaseServices) : super(SearchInitial());
  final DatabaseServices dataBaseServices;
  List<ProductEntity> searchResults = [];

  Future<void> searchFruits(
    String query,
  ) async {
    try {
      emit(SearchLoading());
      if (query.isEmpty) {
        searchResults = [];
        emit(SearchSuccess(products: searchResults));
        return;
      } else {
        var result = await dataBaseServices.searchData(
          query: query,
          path: 'products',
          searchField: 'name',
        );
        //convert to ProductEntity
        List<ProductEntity> products =
            result.map((map) => ProductModel.fromJson(map).toEntity()).toList();
        searchResults = products;
        emit(SearchSuccess(products: searchResults));
      }
    } catch (e) {
      log('error in search cubit $e');
      emit(SearchFailure(message: e.toString()));
      // TODO
    }
  }
}
