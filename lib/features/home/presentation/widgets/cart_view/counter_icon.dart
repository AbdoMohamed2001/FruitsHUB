import 'package:flutter/material.dart';

class CounterIcon extends StatelessWidget {
  const CounterIcon({
    super.key,
    required this.backgroundColor,
    required this.onTap,
    required this.icon,
  });

  final Color backgroundColor;
  final VoidCallback onTap;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 14,
        backgroundColor: backgroundColor,
        child: icon,
      ),
    );
  }
}
