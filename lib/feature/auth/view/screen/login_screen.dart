import 'package:app_test/feature/auth/view/cubit/auth_cubit.dart';
import 'package:app_test/feature/auth/view/widget/button_socal_media_auth.dart';
import 'package:app_test/feature/auth/view/widget/dont_have_account.dart';
import 'package:app_test/feature/auth/view/widget/form_login.dart';
import 'package:app_test/feature/auth/view/widget/upper_bar_icon_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../../../core/extensions/size_extension.dart';
import '../../../../core/router/app_navigator.dart' show AppNavigator;
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../widget/icon_upper_bar_auth.dart' show IconUpperBarAuth;
import '../widget/widget_or_auth.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                    title: 'تسجيل الدخول',
                    subTitle: 'مرحباً بك مجدداً ! أدخل بيانات حسابك للبدء',
                  ),
                  30.h,
                  FormLogin(),

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
                    text: 'ليس لديك حساب ؟ ',
                    button: 'إنشاء حسابك',
                    onTap: () {
                      AppNavigator.pushNamed(context, AppRoutes.signup , arguments: context.read<AuthCubit>());
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
