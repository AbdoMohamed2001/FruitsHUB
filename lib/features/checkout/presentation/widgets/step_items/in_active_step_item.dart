import 'package:flutter/material.dart';

import 'package:fruits_app/core/utils/text_styles.dart';

class InActiveStepItem extends StatelessWidget {
  const InActiveStepItem({super.key, required this.text, required this.index});
  final String text, index;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Color(0xffF2F3F3),
          radius: 12,
          child: Text(
            index,
            style: TextStyles.textStyle13SemiBold.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyles.textStyle13SemiBold.copyWith(
            color: Color(0xffAAAAAA),
          ),
        ),
      ],
    );
  }
}
