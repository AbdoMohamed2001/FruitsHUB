import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_app/features/home/domain/entities/fav_product_entity.dart';
import '../../../../core/entities/product_entity.dart';
import '../../../../core/models/product_model.dart';

class FavouriteProductModel {
  final String docId;
  final String name;
  final num price;
  final String imageUrl;

  FavouriteProductModel({
    required this.docId,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

//To Entity
  FavouriteProductEntity toEntity() {
    return FavouriteProductEntity(
      docId: docId,
      name: name,
      price: price,
      imageUrl: imageUrl,
    );
  }

//To Json
  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'name': name,
      'price': price,
      'imageUrl': imageUrl,
    };
  }

  //To Product Entity

  static Future<List<ProductEntity>> toProductEntityList(
      List<FavouriteProductModel> favs) async {
    //get all products ids
    final List<String> ids = favs.map((e) => e.docId).toList();
//get all products from database
    if (ids.isEmpty) return []; // Return empty result
    final query = await FirebaseFirestore.instance
        .collection('products')
        .where(FieldPath.documentId, whereIn: ids)
        .get();
//convert to product entity
    return query.docs
        .map((doc) => ProductModel.fromJson(doc.data()).toEntity())
        .toList();
  }

//From Json
  factory FavouriteProductModel.fromJson(Map<String, dynamic> json) {
    return FavouriteProductModel(
      docId: json['docId'],
      name: json['name'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }
}
