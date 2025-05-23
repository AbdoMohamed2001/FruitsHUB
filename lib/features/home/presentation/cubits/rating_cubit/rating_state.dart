part of 'rating_cubit.dart';

@immutable
sealed class RatingState {}

final class RatingInitial extends RatingState {}

final class RatingAddedLoading extends RatingState {}

final class RatingAddedSuccess extends RatingState {}

final class RatingAddedFailure extends RatingState {
  final String message;

  RatingAddedFailure(this.message);
}
