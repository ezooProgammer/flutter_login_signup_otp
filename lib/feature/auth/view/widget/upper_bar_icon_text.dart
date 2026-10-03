import 'package:flutter/material.dart';

class UpperBarIconText extends StatelessWidget {
  final String title;
  final String subTitle;
  const UpperBarIconText({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 32 , fontWeight: FontWeight.w500)),
        SizedBox(height: 10),
        Text(subTitle, textAlign: TextAlign.center, style: TextStyle(fontSize: 14 , color: Colors.grey.shade700)),
      ],
    );
  }
}
