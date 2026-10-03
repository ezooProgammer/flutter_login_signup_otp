import 'package:app_test/core/theme/input_borders.dart';
import 'package:app_test/core/util/validators.dart';
import 'package:app_test/core/widgets/custom_text_form_filed.dart';
import 'package:app_test/feature/auth/view/cubit/auth_cubit.dart';
import 'package:app_test/feature/auth/view/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../core/extensions/size_extension.dart';
import '../../../../core/widgets/app_button.dart' show AppButton;

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  bool isObscure = false;
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: emailController,
            hintText: 'البريد الإلكتروني', // ← أضفت تلميحاً عربياً
            validator: (value) {
              return AppValidators.email(value);
            },
            prefixWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedMail01,
                color: Colors.grey.shade600,
              ),
            ),
            fillColor: const Color(0xFFfbfbfb),
            enabledBorder: AppInputBorders.borderless,
            focusedBorder: AppInputBorders.borderless,
          ),
          5.h,
          CustomTextFormField(
            controller: passwordController,
            hintText: 'كلمة المرور', // ← أضفت تلميحاً عربياً
            obscureText: isObscure,
            validator: (value) {
              return AppValidators.password(value);
            },
            prefixWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: HugeIcon(icon: HugeIcons.strokeRoundedLockPassword),
            ),
            colorPrefixIcon: Colors.grey.shade500,
            suffixWidget: IconButton(
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
              icon: isObscure
                  ? HugeIcon(icon: HugeIcons.strokeRoundedLookRight)
                  : HugeIcon(icon: HugeIcons.strokeRoundedLookLeft),
            ),
            fillColor: const Color(0xFFfbfbfb),
            enabledBorder: AppInputBorders.borderless,
            focusedBorder: AppInputBorders.borderless,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'نسيت كلمة المرور؟', // ← ترجمة
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade400,
                ),
              ),
            ],
          ),
          30.h,
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {},

            builder: (context, state) {
              if (state is AuthLoadingLogin) {
                return AppButton(
                  text: 'جاري التحميل',
                  isLoading: true,
                  backgroundColor: const Color(0xFFe62a50),
                );
              }
              return AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().login(
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                backgroundColor: const Color(0xFFe62a50),
                foregroundColor: Colors.white,
                text: 'تسجيل الدخول', // ← ترجمة
              );
            },
          ),
        ],
      ),
    );
  }
}
