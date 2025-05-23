import 'package:fruits_app/core/models/review_model.dart';

num getAvgReviewsRating(List<ReviewModel> reviews) {
  num sum = 0;
  for (var review in reviews) {
    sum += review.rating;
  }
  return sum / reviews.length;
}
