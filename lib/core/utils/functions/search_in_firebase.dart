import 'package:cloud_firestore/cloud_firestore.dart';

import '../../entities/product_entity.dart';
import '../../models/product_model.dart';

Future<void> searchProducts(String query) async {
  if (query.isEmpty) {
    // onResultsChanged([]);
    return;
  }
  //get all docs
  final QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
      .instance
      .collection('products')
      .where('name', isGreaterThanOrEqualTo: query)
      .where('name', isLessThanOrEqualTo: query + '\uf8ff')
      .get();
  //get all products from docs
  final List<ProductEntity> products = snapshot.docs
      .map((doc) => ProductModel.fromJson(doc.data()).toEntity())
      .toList();
  // widget.onResultsChanged(products); // نرجّع النتائج لـ SearchView
}
