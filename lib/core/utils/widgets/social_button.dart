import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../text_styles.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.onTap,
    required this.image,
    required this.text,
  });
  final void Function()? onTap;
  final String image, text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 24.0),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffDDDFDF)),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              image,
              width: 20,
              height: 20,
            ), // Space between text and logo
            SizedBox(width: 53),
            Text(
              text,
              style: TextStyles.textStyle16SemiBold,
            ),
          ],
        ),
      ),
    );
  }
}
