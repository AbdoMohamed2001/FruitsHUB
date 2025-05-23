import 'package:equatable/equatable.dart';
import 'package:fruits_app/core/entities/review_entity.dart';

class ProductEntity extends Equatable {
  final String name;
  final num price;
  final String code;
  final String description;
  final String docId;
  final bool isFeatured;
  String? imageUrl;
  final num expMonths;
  final bool isOrganic;
  final num noOfCalories;
  final num noOfGrams;
  final num avgRating;
  final num ratingCount;
  final List<ReviewEntity> reviews;
  ProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    required this.docId,
    this.imageUrl,
    required this.expMonths,
    required this.isOrganic,
    required this.noOfCalories,
    required this.noOfGrams,
    required this.avgRating,
    required this.ratingCount,
    required this.reviews,
  });

  @override
  List<Object?> get props => [code];
}
