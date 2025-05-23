import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/features/home/presentation/cubits/search_cubit/search_cubit.dart';
import '../../../generated/assets.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({
    super.key,
    this.onChanged,
    this.enabled = false,
    // required this.onResultsChanged,
  });
  final void Function(String?)? onChanged;
  final bool enabled;
  // final Function(List<ProductEntity>) onResultsChanged;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  late final TextEditingController _searchController;
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchController = TextEditingController();
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/search');
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          boxShadow: _isFocused
              ? [
                  BoxShadow(
                    color: Color(0xff000000).withValues(alpha: 0.04),
                    blurRadius: 9,
                    offset: Offset(0, 2),
                    blurStyle: BlurStyle.outer,
                  ),
                ]
              : [],
        ),
        child: TextField(
          focusNode: _focusNode,
          enabled: widget.enabled,
          controller: _searchController,
          onChanged: context.read<SearchCubit>().searchFruits,
          decoration: InputDecoration(
            hintText: 'ابحث عن.......',
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
