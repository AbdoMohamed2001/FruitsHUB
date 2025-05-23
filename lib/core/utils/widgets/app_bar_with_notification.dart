import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/widgets/arrow_back_widget.dart';
import 'package:fruits_app/core/utils/widgets/default_icon.dart';

import '../text_styles.dart';

class CustomAppBarWithNotification extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWithNotification({
    super.key,
    required this.title,
    this.containsLeading = false,
  });
  final String title;
  final bool containsLeading;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
      ),
      child: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          title,
          style: TextStyles.textStyle19Bold,
        ),
        elevation: 0,
        actions: [
          DefaultIcon(
            icon: Icon(
              Icons.notifications_outlined,
              color: Color(0xff1B5E37),
            ),
          )
        ],
        leading: containsLeading ? ArrowBackWidget() : null,
        leadingWidth: 44,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
