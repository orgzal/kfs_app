import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({
    super.key,
    required this.icon,
    this.onTap,
    required this.iconColor,
    required this.borderColor,
    this.backgroundColor = Colors.transparent,
    required this.iconSize,
    required this.padding,
  });
  final IconData icon;
  final void Function()? onTap;
  final Color iconColor;
  final Color borderColor;
  final Color backgroundColor;
  final double iconSize;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(250),
      child: Container(
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: borderColor),
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
    );
  }
}
