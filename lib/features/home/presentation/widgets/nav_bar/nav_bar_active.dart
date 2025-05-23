import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/text_styles.dart';

class NavBarActiveItem extends StatelessWidget {
  const NavBarActiveItem({super.key, required this.image, required this.text});

  final String image, text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: Color(0xffeeeeee),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Color(0xff1b5e37),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: SvgPicture.asset(
                alignment: Alignment.center,
                width: 16,
                height: 16,
                image,
                color: Colors.white,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SizedBox(width: 4),
          Text(
            text,
            style: TextStyles.textStyle11SemiBold
                .copyWith(color: Color(0xff1B5E37)),
          ),
          SizedBox(width: 7),
        ],
      ),
    );
  }
}
