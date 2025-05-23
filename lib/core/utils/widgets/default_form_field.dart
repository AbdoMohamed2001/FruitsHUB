import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/text_styles.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.containsSuffix,
    required this.onSaved,
  });

  final String hintText;
  final TextInputType textInputType;
  final bool containsSuffix;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      style: TextStyles.textStyle16SemiBold.copyWith(
        decoration: TextDecoration.none,
        decorationThickness: 0,
      ),
      keyboardType: textInputType,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 17),
        fillColor: Color(0xffF9FAFA),
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Color(0xff949D9E),
        ),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(width: 1, color: Color(0xffE6E9EA)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(width: 1, color: Color(0xffE6E9EA)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(width: 1, color: Color(0xffE6E9EA)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(width: 1, color: AppColors.kPrimary),
        ),
        errorStyle: TextStyles.textStyle13Regular,
        suffixIcon: containsSuffix
            ? IconButton(
                padding: EdgeInsets.symmetric(horizontal: 32),
                onPressed: () {},
                icon: Icon(
                  Icons.remove_red_eye_rounded,
                  color: Color(0xffC9CECF),
                ),
              )
            : null,
      ),
    );
  }
}
