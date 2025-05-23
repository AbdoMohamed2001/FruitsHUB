import 'package:cloud_firestore/cloud_firestore.dart';

import '../entities/review_entity.dart';

class ReviewModel extends ReviewEntity {
  ReviewModel({
    required super.name,
    required super.image,
    required super.date,
    required super.comment,
    required super.rating,
  });
  factory ReviewModel.fromEntity(ReviewEntity reviewEntity) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      date: reviewEntity.date,
      comment: reviewEntity.comment,
      rating: reviewEntity.rating,
    );
  }
  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      image: json['image'],
      date: (json['date'] as Timestamp).toDate(),
      comment: json['comment'],
      rating: json['rating'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'date': date,
      'comment': comment,
      'rating': rating,
    };
  }

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      image: image,
      date: date,
      comment: comment,
      rating: rating,
    );
  }
}
