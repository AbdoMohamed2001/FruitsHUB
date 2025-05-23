import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_app/core/utils/backend_endpoints.dart';
import 'package:fruits_app/core/utils/functions/getCachedUserData.dart';

import '../../entities/product_entity.dart';
import '../../models/product_model.dart';

Stream<List<ProductEntity>> streamUserFavourites() {
  return FirebaseFirestore.instance
      .collection('users')
      .doc(getCachedUserData().id)
      .collection(BackEndEndPoints.userFavouriteCollection)
      .snapshots()
      .asyncMap((snapshot) async {
    final favDocs = snapshot.docs;

    if (favDocs.isEmpty) return [];

    final favIds = favDocs.map((doc) => doc.id).toList();

    // Get full product documents using the IDs
    final productQuery = await FirebaseFirestore.instance
        .collection('products')
        .where(FieldPath.documentId, whereIn: favIds)
        .get();

    return productQuery.docs
        .map((doc) => ProductModel.fromJson(doc.data()).toEntity())
        .toList();
  });
}
