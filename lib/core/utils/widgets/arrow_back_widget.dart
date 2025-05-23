import 'package:flutter/material.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border:
            Border.all(color: Color(0xffF1F1F5), width: 1), // Circular border
      ),
      child: IconButton(
        padding: EdgeInsets.all(0),
        // focusColor: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.keyboard_arrow_right_sharp,
          size: 28,
        ),
      ),
    );
  }
}
