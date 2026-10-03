import 'package:flutter/material.dart';

class WidgetOrAuth extends StatelessWidget {
  const WidgetOrAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: Colors.grey.shade400,
            thickness: 1,
            endIndent: 8,
          ),
        ),

        Text(
          'او',
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),

        Expanded(
          child: Divider(color: Colors.grey.shade400, thickness: 1, indent: 8),
        ),
      ],
    );
  }
}
