import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/text_styles.dart';
import 'package:fruits_app/core/utils/widgets/custom_button.dart';
import 'package:roundcheckbox/roundcheckbox.dart';

void showBlurredBottomSheet(BuildContext context) {
  var deviceHeight = MediaQuery.of(context).size.height;
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "BottomSheet",
    barrierColor: Colors.transparent, // no dim
    pageBuilder: (context, animation, secondaryAnimation) {
      return Stack(
        children: [
// Blurred background
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5),
            child: Container(
              color: Colors.black.withOpacity(0.2), // optional dark overlay
            ),
          ),

// Bottom sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              color: Colors.white,
              child: SizedBox(
                height: deviceHeight * 0.35,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 25),
                      Center(
                        child: Container(
                          width: 60,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color(0xff131F46),
                          ),
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.029),
                      Text(
                        "ترتيب حسب :",
                        style: TextStyles.textStyle19Bold,
                      ),
                      SizedBox(height: deviceHeight * 0.016),
                      CustomRoundCheckBox(
                        isChecked: (value) {},
                        text: 'السعر ( الأقل الي الأعلي )',
                      ),
                      const SizedBox(height: 16),
                      CustomRoundCheckBox(
                        isChecked: (value) {},
                        text: 'السعر ( الأعلي الي الأقل )',
                      ),
                      SizedBox(height: deviceHeight * 0.018),
                      CustomRoundCheckBox(
                        isChecked: (value) {},
                        text: 'الأبجديه',
                      ),
                      SizedBox(height: deviceHeight * 0.018),
                      CustomButton(onPressed: () {}, text: 'تصفيه'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

class CustomRoundCheckBox extends StatelessWidget {
  const CustomRoundCheckBox({
    super.key,
    this.isChecked,
    required this.text,
  });
  final Function(bool?)? isChecked;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RoundCheckBox(
          onTap: isChecked,
          size: 18,
          border: Border.all(
            color: Color(0xff949D9E),
            width: 1,
          ),
        ),
        SizedBox(width: 16),
        Text(
          text,
          style: TextStyles.textStyle13Bold,
        ),
      ],
    );
  }
}
