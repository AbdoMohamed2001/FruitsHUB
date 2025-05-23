import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits_app/core/utils/constants.dart';
import 'package:fruits_app/core/utils/text_styles.dart';

import '../../../../../core/services/shared_prefs_services.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.bgImage,
    required this.subtitle,
    required this.title,
    required this.isVisible,
  });

  final String image, bgImage, subtitle;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                bgImage,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SvgPicture.asset(image),
            ),
            Visibility(
              visible: isVisible,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool(kIsOnBoardingSeen, true);
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: Text(
                    'تخط',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                      color: Color(0xff949D9E),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 64,
        ),
        title,
        SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Text(
              textAlign: TextAlign.center,
              subtitle,
              style: TextStyles.textStyle13SemiBold.copyWith(
                color: Color(0xff4E5556),
              )),
        ),
      ],
    );
  }
}
