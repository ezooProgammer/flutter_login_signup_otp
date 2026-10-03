import 'package:flutter/material.dart';

import '../extensions/size_extension.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? radius;
  final Color? colorText;
  final double? height;
  final double? width;
  final BorderSide? borderSide;
  final Widget? childWidget;
  const AppButton({

    super.key,
    this.height,
    this.childWidget,
    this.width,
    this.borderSide,
    this.colorText = Colors.white,
    this.radius,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // القيم الافتراضية من الثيم
    final bgColor = backgroundColor ?? Colors.transparent;
    final fgColor = foregroundColor ?? theme.colorScheme.primary;

    return SizedBox(
      width: double.infinity,
      height: height ?? 50,
      child: TextButton(
        onPressed: isLoading ? null : onPressed,
        style: TextButton.styleFrom(
          side: borderSide,
          backgroundColor: bgColor,
          foregroundColor: fgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 25),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: fgColor,
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ?childWidget,
                  if (icon != null) Icon(icon),
                  15.w,
                  Text(text, style: TextStyle(color: colorText)),
                ],
              ),
      ),
    );
  }
}
