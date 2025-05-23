import 'package:fruits_app/core/models/review_model.dart';

import '../entities/product_entity.dart';
import '../utils/functions/get_avg_rating.dart';

class ProductModel {
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
  final List<ReviewModel> reviews;
  final num salesCount;

  ProductModel({
    this.salesCount = 0,
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.isFeatured,
    required this.expMonths,
    required this.isOrganic,
    required this.noOfCalories,
    required this.noOfGrams,
    required this.avgRating,
    required this.ratingCount,
    required this.reviews,
    required this.docId,
    this.imageUrl,
  });

  factory ProductModel.fromEntity(ProductEntity productEntity) {
    return ProductModel(
      reviews:
          productEntity.reviews.map((e) => ReviewModel.fromEntity(e)).toList(),
      name: productEntity.name,
      price: productEntity.price,
      code: productEntity.code,
      description: productEntity.description,
      isFeatured: productEntity.isFeatured,
      imageUrl: productEntity.imageUrl,
      expMonths: productEntity.expMonths,
      isOrganic: productEntity.isOrganic,
      noOfCalories: productEntity.noOfCalories,
      noOfGrams: productEntity.noOfGrams,
      avgRating: productEntity.avgRating,
      ratingCount: productEntity.ratingCount,
      docId: productEntity.docId,
    );
  }
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      isFeatured: json['isFeatured'],
      docId: json['docId'],
      imageUrl: json['imageUrl'],
      expMonths: json['expMonths'],
      isOrganic: json['isOrganic'],
      noOfCalories: json['noOfCalories'],
      noOfGrams: json['noOfGrams'],
      avgRating: json['avgRating'],
      ratingCount: json['ratingCount'],
      salesCount: json['salesCount'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      price: price,
      code: code,
      description: description,
      isFeatured: isFeatured,
      docId: docId,
      imageUrl: imageUrl,
      expMonths: expMonths,
      isOrganic: isOrganic,
      noOfCalories: noOfCalories,
      noOfGrams: noOfGrams,
      avgRating: getAvgReviewsRating(reviews),
      ratingCount: ratingCount,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'isFeatured': isFeatured,
      'docId': docId,
      'imageUrl': imageUrl,
      'expMonths': expMonths,
      'isOrganic': isOrganic,
      'noOfCalories': noOfCalories,
      'noOfGrams': noOfGrams,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'salesCount': salesCount,
    };
  }
}
