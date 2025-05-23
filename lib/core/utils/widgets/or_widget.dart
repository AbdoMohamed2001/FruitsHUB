import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/text_styles.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Text(
            text,
            style: TextStyles.textStyle16SemiBold,
          ),
        ),
        Expanded(
          child: Divider(),
        ),
      ],
    );
  }
}
