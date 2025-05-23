import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:fruits_app/core/services/database_services.dart';
import 'package:meta/meta.dart';

import '../../../../../core/entities/product_entity.dart';

part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit(this.databaseServices) : super(RatingInitial());
  final DatabaseServices databaseServices;

  addRating({
    required Map<String, dynamic> review,
    required String recordId,
    required num ratingCount,
    required num reviewsLength,
    required ProductEntity product,
  }) async {
    emit(RatingAddedLoading());
    var result = await databaseServices.addReview(
        path: 'products', review: review, recordId: recordId);
    await incrementRating(recordId: recordId, rating: ratingCount);
    await updateAvgRating(
        recordId: recordId, reviewsLength: reviewsLength, product: product);
    result.fold((f) {
      emit(RatingAddedFailure(f.message));
    }, (s) {
      emit(RatingAddedSuccess());
    });
  }

  incrementRating({
    required String recordId,
    required num rating,
  }) async {
    await databaseServices.updateData(
      path: 'products',
      recordId: recordId,
      fieldName: 'ratingCount',
      fieldData: rating,
    );
  }

  updateAvgRating(
      {required String recordId,
      required num reviewsLength,
      required ProductEntity product}) async {
    num totalRating = 0;
    num avgRating = 0;
    for (int i = 0; i < product.reviews.length; i++) {
      totalRating += product.reviews[i].rating;
      log('this is total rating $totalRating');
      avgRating = totalRating / reviewsLength;
      log('this is avg rating $avgRating');
    }
    await databaseServices.updateData(
      path: 'products',
      recordId: recordId,
      fieldName: 'avgRating',
      fieldData: avgRating,
    );
  }
}
