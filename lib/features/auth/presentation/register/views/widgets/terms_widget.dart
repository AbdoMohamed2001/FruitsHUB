import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/text_styles.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({
    super.key,
    required this.onTermAccepted,
  });
  final ValueChanged<bool> onTermAccepted;
  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {
  late bool isTermAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 3,
            ),
            SizedBox(
              width: 24,
              height: 24,
              child: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  side: BorderSide(
                    color: Color(0xffDDDFDF),
                    width: 1.5,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  value: isTermAccepted,
                  activeColor: AppColors.kPrimary,
                  onChanged: (value) {
                    setState(() {
                      isTermAccepted = value!;
                      widget.onTermAccepted(value);
                    });
                  },
                ),
              ),
            ),
            Container(),
          ],
        ),
        SizedBox(
          width: 16,
        ),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'من خلال إنشاء حساب ، فإنك توافق على ',
              style: TextStyles.textStyle16SemiBold.copyWith(
                color: Color(0xff616A6B),
                fontFamily: GoogleFonts.cairo().fontFamily,
              ),
              children: [
                TextSpan(
                  text: 'الشروط ',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: 'والأحكام الخاصة بنا ',
                  style: TextStyle(
                    color: Colors.green[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
