import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/entities/product_entity.dart';
import '../../../../../core/services/database_services.dart';
import '../../../../../core/services/get_it_services_locator.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../cubits/rating_cubit/rating_cubit.dart';
import 'comment_field.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double rating = 3;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RatingCubit(getIt.get<DatabaseServices>()),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            width: 120,
                            height: 80,
                            child:
                                Image.network(widget.productEntity.imageUrl!),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.productEntity.name,
                            style: TextStyles.textStyle16SemiBold,
                          ),
                        ],
                      ),
                      const SizedBox(width: 30),
                      AnimatedRatingStars(
                        initialRating: rating,
                        onChanged: (value) {
                          setState(() {
                            rating = value;
                          });
                        },
                        customFilledIcon: Icons.star,
                        customHalfFilledIcon: Icons.star_half,
                        customEmptyIcon: Icons.star_border,
                        starSize: 40.0,
                        animationDuration: Duration(milliseconds: 300),
                        animationCurve: Curves.easeInOut,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  CommentField(
                    productEntity: widget.productEntity,
                    formKey: _formKey,
                    rating: rating,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
