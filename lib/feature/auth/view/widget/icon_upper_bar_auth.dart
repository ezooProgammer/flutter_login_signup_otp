import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart' show HugeIcons, HugeIcon;

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_circle_avatar.dart';

class IconUpperBarAuth extends StatelessWidget {
  const IconUpperBarAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCircleAvatar(
      childWidget: HugeIcon(
        icon: HugeIcons.strokeRoundedAirplaneTakeOff01,
        color: AppColors.primaryColor,
        size: 32,
      ),
      radius: 60,
      backgroundColor: Color(0xFFfedbd5),
    );
  }
}
