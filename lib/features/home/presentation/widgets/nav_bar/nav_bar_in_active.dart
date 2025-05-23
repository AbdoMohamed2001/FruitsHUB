import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarInActive extends StatelessWidget {
  const NavBarInActive({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(image);
  }
}
