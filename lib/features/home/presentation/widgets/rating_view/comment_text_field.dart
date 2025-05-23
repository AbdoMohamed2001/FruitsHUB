import 'package:flutter/material.dart';
import 'package:fruits_app/core/entities/product_entity.dart';
import 'package:fruits_app/core/utils/functions/getCachedUserData.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import 'comment_bottom_sheet.dart';

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => CommentBottomSheet(
            productEntity: productEntity,
          ),
        );
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
        child: TextField(
          enabled: false,
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
