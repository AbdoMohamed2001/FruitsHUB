import 'package:flutter/material.dart';

import '../../../../../../core/utils/text_styles.dart';
import '../app_colors.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({
    super.key,
    required this.isChecked,
    required this.text,
  });
  final ValueChanged<bool> isChecked;
  final String text;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  late bool isChecked = false;
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
                  value: isChecked,
                  activeColor: AppColors.kPrimary,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                      widget.isChecked(value);
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
          child: Text(
            widget.text,
            style: TextStyles.textStyle16Regular,
          ),
        ),
      ],
    );
  }
}
