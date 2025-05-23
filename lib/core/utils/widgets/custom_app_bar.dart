import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constants.dart';

import '../text_styles.dart';
import 'arrow_back_widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: AppBar(
        centerTitle: true,
        leading: ArrowBackWidget(),
        leadingWidth: 44,
        title: Text(
          title,
          style: TextStyles.textStyle19Bold,
        ),
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
