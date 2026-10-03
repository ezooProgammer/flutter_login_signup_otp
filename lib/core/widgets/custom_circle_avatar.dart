import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final IconData? icon;
  final String? imagePath;
  final Color? iconColor;
  final Widget? childWidget;
  final Color? backgroundColor;
  final double radius;
  final double? iconSize;
  final BoxDecoration? decoration;
  const CustomCircleAvatar({
    super.key,
    this.icon,  
    this.decoration,
    this.childWidget,
    this.imagePath,
    this.iconColor,
    this.backgroundColor,
    this.radius = 18,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasImage = imagePath != null && imagePath!.isNotEmpty;
    return Container(
      decoration: decoration,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: backgroundColor ?? Colors.grey.shade200,
        backgroundImage: hasImage ? AssetImage(imagePath!) : null,
        child: childWidget ?? (hasImage ? null  :   (icon != null ? Icon(icon, color: iconColor, size: iconSize ?? radius * 1.2): null)),
      ),
    );
  }
}
