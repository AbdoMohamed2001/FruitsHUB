import 'package:flutter/material.dart';
import 'package:fruits_app/core/utils/widgets/arrow_back_widget.dart';

import '../../../../generated/assets.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: BottomCurveClipper(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.43,
        color: const Color(0xFFF5F5F5), // Light gray background
        padding: const EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              image, // Replace with your image asset
              width: MediaQuery.of(context).size.width * 0.5,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 30,
              right: 0,
              child: ArrowBackWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40); // Start from bottom left
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 40,
    ); // Curve at the bottom
    path.lineTo(size.width, 0); // Go to top right
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
