import 'package:flutter/material.dart';

extension SizeExtension on num {
  SizedBox get w => SizedBox(width: toDouble());
  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get wh => SizedBox(width: toDouble(), height: toDouble());
  SizedBox get box => SizedBox(width: toDouble(), height: toDouble());
}