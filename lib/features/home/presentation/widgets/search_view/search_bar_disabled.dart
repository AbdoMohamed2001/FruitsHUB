import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/cubits/products_cubit/products_cubit.dart';
import '../../../../../generated/assets.dart';

class DisabledSearchBar extends StatelessWidget {
  const DisabledSearchBar({
    super.key,
    this.onChanged,
    this.enabled = false,
  });
  final void Function(String?)? onChanged;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search',
            arguments: context.read<ProductsCubit>());
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(4), boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withValues(alpha: 0.04),
            blurRadius: 9,
            offset: Offset(0, 2),
            blurStyle: BlurStyle.outer,
          ),
        ]),
        child: TextField(
          enabled: enabled,
          // onChanged: searchProducts,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              top: 8,
              bottom: 7,
            ),
            suffixIconConstraints: BoxConstraints(
              minHeight: 20,
              maxHeight: 20,
            ),
            prefixIconConstraints: BoxConstraints(
              minHeight: 20,
              minWidth: 20,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: SvgPicture.asset(Assets.imagesSettingIcon),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13.0),
              child: SvgPicture.asset(Assets.imagesSearchIcon),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
                width: 0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
