import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';

class PasswordFormField extends StatefulWidget {
  const PasswordFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    required this.containsSuffix,
    this.onSaved,
    this.onChanged,
  });

  final String hintText;
  final TextInputType textInputType;
  final bool containsSuffix;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;

  @override
  State<PasswordFormField> createState() => _PasswordFormFieldState();
}

class _PasswordFormFieldState extends State<PasswordFormField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
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
      keyboardType: widget.textInputType,
      obscureText: isObscure,
      obscuringCharacter: '●',
      decoration: InputDecoration(
        contentPadding:
            EdgeInsets.only(right: 20, left: 20, top: 15, bottom: 17),
        fillColor: Color(0xffF9FAFA),
        hintText: widget.hintText,
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
        suffixIcon: widget.containsSuffix
            ? IconButton(
                padding: EdgeInsets.symmetric(horizontal: 33),
                onPressed: () {
                  isObscure = !isObscure;
                  setState(() {});
                },
                icon: Icon(
                  isObscure
                      ? Icons.visibility_rounded
                      : Icons.visibility_off_rounded,
                  color: Color(0xffC9CECF),
                ),
              )
            : null,
      ),
    );
  }
}
