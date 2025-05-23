class ReviewEntity {
  final String name;
  final String image;
  final DateTime date;
  final String comment;
  final num rating;

  ReviewEntity({
    required this.name,
    required this.image,
    required this.date,
    required this.comment,
    required this.rating,
  });

  calcAvgRating() {
    //length / total rating
  }
  incrementRating() {}
}
