import 'package:app_test/core/router/app_navigator.dart';
import 'package:app_test/core/router/app_routes.dart';
import 'package:app_test/feature/auth/view/widget/dont_have_account.dart';
import 'package:app_test/feature/auth/view/widget/form_signup.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../core/extensions/size_extension.dart';
import '../../../../core/theme/app_colors.dart';
import '../widget/button_socal_media_auth.dart';
import '../widget/icon_upper_bar_auth.dart';
import '../widget/upper_bar_icon_text.dart';
import '../widget/widget_or_auth.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundScaffold,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  20.h,
                  IconUpperBarAuth(),
                  30.h,
                  UpperBarIconText(
                    title: 'إنشاء حساب',
                    subTitle:
                        'يُرجى إدخال الرمز الذي أرسلناه \n للتو إلى البريد الإلكتروني',
                  ),
                  30.h,

                  FormSignup(),
                  15.h,
                  WidgetOrAuth(),
                  20.h,
                  ButtonSocalMediaAuth(
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedMailAtSign02,
                      size: 28,
                      color: Colors.redAccent,
                    ),
                    text: 'تسجيل الدخول باستخدام Google',
                  ),
                  15.h,
                  ButtonSocalMediaAuth(
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedFacebook02,
                      size: 28,
                      color: Colors.blue,
                    ),
                    text: 'تسجيل الدخول باستخدام فيسبوك',
                  ),

                  15.h,
                  DontHaveAccount(
                    text: 'لديك حساب ؟ ',
                    button: 'سجل دخولك',
                    onTap: () {
                      AppNavigator.pushNamed(context, AppRoutes.login);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
