import 'package:app_test/core/widgets/app_button.dart';
import 'package:flutter/material.dart';

class ButtonSocalMediaAuth extends StatelessWidget {
  final Widget? icon;
  final String? text;

  const ButtonSocalMediaAuth({super.key, this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      text: text!,
      childWidget: icon,
      colorText: Colors.black,
      borderSide: BorderSide(color: Colors.black38, width: 1),
    );
  }
}
