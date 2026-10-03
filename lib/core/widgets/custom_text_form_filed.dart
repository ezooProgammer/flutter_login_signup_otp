import 'package:app_test/core/theme/app_boxconstraints.dart';
import 'package:app_test/core/theme/input_borders.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;

  final String? hintText;
  final String? errorText;
  final String? initialValue;

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final BoxConstraints? prefixIconConstraints; // تحكم في حجم ايقونة

  // Colors
  final Color? colorPrefixIcon;
  final Color? colorSuffixIcon;
  final Color? fillColor;
  final Color? borderColor;

  final VoidCallback? onSuffixIconPressed;

  final bool obscureText;
  final bool readOnly;
  final bool enabled;

  final TextInputType keyboardType;
  final int? maxLines;
  final int? maxLength;
  final String? Function(String?)? validator;
  final void Function(String)?
  onChanged; // يستدعي تلقائي عند حدوث تغير في نص مكتوب

  final void Function()? onTap; // يستدعي تلقائي عندما ضعط على حقل

  final TextAlign textAlign;

  final double? borderRadius;
  final EdgeInsetsGeometry? contentPadding;

  // Style Filed
  final TextStyle? style;
  final TextStyle? hintStyle;

  // Border Filed
  final OutlineInputBorder? enabledBorder;
  final OutlineInputBorder? focusedBorder;
  final OutlineInputBorder? errorBorder;
  const CustomTextFormField({
    super.key,
    this.controller,
    this.prefixIconConstraints,
    this.initialValue,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixIconPressed,
    this.obscureText = false,
    this.readOnly = false,
    this.enabled = true,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.maxLength,
    this.validator,
    this.onChanged,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
    this.contentPadding,
    this.style,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.colorPrefixIcon,
    this.colorSuffixIcon,
    this.prefixWidget,
    this.suffixWidget,
    this.errorBorder,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultBorderColor = borderColor ?? theme.colorScheme.outline;
    final defaultFillColor = fillColor ?? theme.colorScheme.surface;
    final defaultRadius = borderRadius ?? 12.0;

    return TextFormField(
      initialValue: initialValue,
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLines: maxLines,

      maxLength: maxLength,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      textAlign: textAlign,
      style: style ?? theme.textTheme.bodyLarge,
      decoration: InputDecoration(
        prefixIconConstraints:
            prefixIconConstraints ?? AppBoxConstraints.defaultIconSize,
        suffixIconConstraints: AppBoxConstraints.defaultIconSize,
        hintText: hintText,
        errorText: errorText,
        hintStyle:
            hintStyle ??
            theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface,
            ),

        prefixIcon: prefixIcon != null && prefixWidget == null
            ? Icon(prefixIcon, color: colorPrefixIcon)
            : prefixWidget,

        suffixIcon: suffixIcon != null && suffixWidget == null
            ? IconButton(
                icon: Icon(suffixIcon, color: colorSuffixIcon),
                onPressed: onSuffixIconPressed,
                color: theme.colorScheme.primary,
              )
            : suffixWidget,
        filled: true,
        fillColor: defaultFillColor,
        contentPadding:
            contentPadding ??
            const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

        enabledBorder:
            enabledBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: BorderSide(color: defaultBorderColor),
            ),

        focusedBorder:
            focusedBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
            ),

        errorBorder:
            errorBorder ??
            OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultRadius),
              borderSide: BorderSide(
                color: theme.colorScheme.error,
                width: 1.5,
              ),
            ),
        focusedErrorBorder: AppInputBorders.errorBorderless,
      ),
    );
  }
}
