import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/features/home/presentation/widgets/rating_view/comment_list_view.dart';
import 'package:fruits_app/features/home/presentation/widgets/rating_view/rating_summary_widget.dart';
import 'comment_text_field.dart';

class RatingViewBody extends StatelessWidget {
  const RatingViewBody({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final docRef = FirebaseFirestore.instance
        .collection('products')
        .doc(productEntity.docId);
    return StreamBuilder<DocumentSnapshot>(
        stream: docRef.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Product not found.'));
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      //TextField
                      CommentTextField(
                        productEntity: productEntity,
                      ),
                      SizedBox(height: 16),
                      RatingSummaryWidget(
                        productEntity: productEntity,
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
                CommentListView(productEntity: productEntity),
                SliverToBoxAdapter(
                  child: SizedBox(height: 16),
                ),
              ],
            ),
          );
        });
  }
}
