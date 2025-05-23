import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/models/review_model.dart';
import 'package:fruits_app/core/utils/functions/build_error_bar.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/functions/getCachedUserData.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../cubits/rating_cubit/rating_cubit.dart';

class CommentField extends StatefulWidget {
  const CommentField({
    super.key,
    required this.productEntity,
    required this.formKey,
    required this.rating,
  });

  final ProductEntity productEntity;
  final GlobalKey<FormState> formKey;
  final double rating;

  @override
  State<CommentField> createState() => _CommentFieldState();
}

class _CommentFieldState extends State<CommentField> {
  late String comment;

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatingCubit, RatingState>(
      listener: (context, state) {
        if (state is RatingAddedSuccess) {
          showSnackBar(context, 'تم إضافة المراجعة بنجاح');
          Navigator.pop(context);
        }
        if (state is RatingAddedFailure) {
          showSnackBar(context, state.message);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(233, 233, 233, 0.25),
              blurRadius: 45,
              offset: Offset(15, 20),
              blurStyle: BlurStyle.inner,
            ),
          ],
        ),
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              comment = value;
            });
          },
          validator: (value) {
            if (value!.isEmpty ||
                value == '' ||
                value == ' ' ||
                value == '  ') {
              return 'من فضلك اكتب تعليقك';
            }
            return null;
          },
          decoration: InputDecoration(
            contentPadding:
                EdgeInsets.only(right: 15, left: 15, top: 15, bottom: 15),
            fillColor: Colors.white,
            hintText: 'اكتب المراجعة..',
            hintStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            filled: true,
            prefixIconConstraints: BoxConstraints(maxHeight: 35),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 20,
                child: Image.network(getCachedUserData().imageUrl),
                // child: Image.asset(Assets.imagesAvatar),
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: GestureDetector(
                onTap: () {
                  if (widget.formKey.currentState!.validate()) {
                    ReviewModel reviewModel = ReviewModel(
                      name: getCachedUserData().name,
                      image: getCachedUserData().imageUrl,
                      date: DateTime.now(),
                      comment: comment,
                      rating: widget.rating,
                    );
                    widget.productEntity.reviews.add(reviewModel);
                    context.read<RatingCubit>().addRating(
                          review: reviewModel.toJson(),
                          recordId: widget.productEntity.docId,
                          ratingCount: widget.productEntity.reviews.length,
                          reviewsLength: widget.productEntity.reviews.length,
                          product: widget.productEntity,
                        );
                  }
                },
                child: Icon(
                  Icons.send,
                  textDirection: TextDirection.ltr,
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Color(0xffEEEEEE)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Color(0xffEEEEEE)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: Color(0xffEEEEEE)),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1, color: AppColors.kPrimary),
            ),
            errorStyle: TextStyles.textStyle13Regular,
          ),
        ),
      ),
    );
  }
}
