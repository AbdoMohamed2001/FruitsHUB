import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/home/domain/entities/fav_product_entity.dart';

import '../../entities/review_entity.dart';

ProductEntity getDummyProduct() {
  return ProductEntity(
    name: "Organic Avocado",
    price: 3.99,
    code: "AVC123",
    description: "Fresh organic avocado, perfect for salads and toast.",
    isFeatured: true,
    docId: 'dummyId',
    imageUrl:
        "https://m.media-amazon.com/images/I/61dV53UuRVS._AC_UF894,1000_QL80_.jpg",
    expMonths: 2,
    isOrganic: true,
    noOfCalories: 160,
    noOfGrams: 200,
    avgRating: 4.7,
    ratingCount: 134,
    reviews: [
      ReviewEntity(
        name: 'Alice',
        rating: 5,
        comment:
            'This avocado is so fresh and delicious! It\'s perfect for my morning smoothie.',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXLb3TY72rHh4VSJUR8UGa83p3ABg3FRBNrw&s',
        date: DateTime.now(),

        // reviewerName: "Alice",
        // rating: 5,
        // comment: "Super fresh and delicious!",
      ),
      ReviewEntity(
        name: 'Alice',
        rating: 5,
        comment:
            'This avocado is so fresh and delicious! It\'s perfect for my morning smoothie.',
        image:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTXLb3TY72rHh4VSJUR8UGa83p3ABg3FRBNrw&s',
        date: DateTime.now(),

        // reviewerName: "Alice",
        // rating: 5,
        // comment: "Super fresh and delicious!",
      ),
    ],
  );
}

List<ProductEntity> getDummyProducts() {
  return [
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
    getDummyProduct(),
  ];
}

FavouriteProductEntity getDummyFavProduct() {
  return FavouriteProductEntity(
    docId: '',
    name: 'Avocado',
    price: 2.99,
    imageUrl:
        'https://m.media-amazon.com/images/I/61dV53UuRVS._AC_UF894,1000_QL80_.jpg',
  );
}

List<FavouriteProductEntity> getDummyFavProducts() {
  return [
    getDummyFavProduct(),
    getDummyFavProduct(),
  ];
}
