import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:fruits_app/core/utils/text_styles.dart';

import '../../../../../generated/assets.dart';

class ActiveStepItem extends StatelessWidget {
  const ActiveStepItem({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.kPrimary,
          radius: 12,
          child: SvgPicture.asset(Assets.imagesTrue),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyles.textStyle13Bold,
        ),
      ],
    );
  }
}
