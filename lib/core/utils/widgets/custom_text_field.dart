import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/text_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.textInputType = TextInputType.text,
    this.onSaved,
    this.onChanged,
    this.suffixIcon,
  });

  final String hintText;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      onChanged: onChanged,
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
        suffixIcon: suffixIcon,
      ),
    );
  }
}
