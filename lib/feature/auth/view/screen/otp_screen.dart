import 'package:app_test/core/widgets/custom_circle_avatar.dart';
import 'package:app_test/feature/auth/view/cubit/auth_cubit.dart';
import 'package:app_test/feature/auth/view/cubit/auth_state.dart';
import 'package:app_test/feature/auth/view/widget/icon_upper_bar_auth.dart'
    show IconUpperBarAuth;
import 'package:app_test/feature/auth/view/widget/upper_bar_icon_text.dart'
    show UpperBarIconText;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/extensions/size_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart' show AppButton;
import '../../../../core/widgets/otp_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Column(
              children: [
                20.h,
                Row(
                  children: [
                    CustomCircleAvatar(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.grey.shade700,
                          width: 0.5,
                        ),
                      ),
                      radius: 20,
                      backgroundColor: Colors.white,
                      childWidget: HugeIcon(
                        icon: HugeIcons.strokeRoundedArrowRight01,
                        color: Colors.black,
                        size: 22,
                      ),
                    ),
                  ],
                ),

                30.h,

                IconUpperBarAuth(),
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state is AuthSuccessSendOtp) {
                      return UpperBarIconText(
                        title: 'أدخل رمز التحقق (OTP)',
                        subTitle:
                            'تم إرسال رمز التحقق (OTP) إلى ${state.phoneNumber}',
                      );
                    }
                    return UpperBarIconText(
                      title: 'أدخل رمز التحقق (OTP)',
                      subTitle: 'تم إرسال رمز التحقق (OTP) إلى 09xxxxxxxx',
                    );
                  },
                ),

                30.h,
                OtpField(
                  length: 5,
                  onChanged: (code) => debugPrint('Current: $code'),
                  onCompleted: (code) {
                    debugPrint('Completed: $code');
                    // تحقق من الرمز هنا
                  },
                ),
              
                10.h,
                AppButton(
                  text: 'تحقق',
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    // تحقق من الرمز هنا
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
