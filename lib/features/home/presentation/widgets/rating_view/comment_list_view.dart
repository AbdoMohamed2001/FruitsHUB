import 'package:flutter/cupertino.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/features/home/presentation/widgets/rating_view/comment_item.dart';

class CommentListView extends StatelessWidget {
  const CommentListView({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemBuilder: (_, i) => CommentItem(
        reviewEntity: productEntity.reviews[i],
      ),
      separatorBuilder: (_, i) => SizedBox(height: 16),
      itemCount: productEntity.reviews.length,
    );
  }
}
