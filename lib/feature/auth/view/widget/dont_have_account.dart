import 'package:flutter/material.dart';

class DontHaveAccount extends StatelessWidget {
  final String text;
  final String button;
  final VoidCallback onTap;

  const DontHaveAccount({
    super.key,
    required this.text,
    required this.button,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        GestureDetector(
          onTap: onTap,
          child: Text(
            button,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
