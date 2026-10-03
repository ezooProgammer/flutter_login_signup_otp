import 'package:app_test/feature/auth/view/cubit/auth_state.dart'
    show AuthLoadingSignup, AuthState, AuthSuccessSendOtp;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart' show HugeIcon, HugeIcons;

import '../../../../core/extensions/size_extension.dart';
import '../../../../core/router/app_navigator.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/theme/input_borders.dart';
import '../../../../core/util/messenger.dart';
import '../../../../core/util/validators.dart' show AppValidators;
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/custom_text_form_filed.dart';
import '../cubit/auth_cubit.dart';

class FormSignup extends StatefulWidget {
  const FormSignup({super.key});

  @override
  State<FormSignup> createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  bool isObscure = false;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            keyboardType: TextInputType.phone,
            controller: phoneController,
            hintText: 'رقم الهاتف',
            validator: (value) {
              return AppValidators.libyanPhone(value);
            },
            prefixWidget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedPhoneCheck,
                color: Colors.grey.shade600,
              ),
            ),
            fillColor: const Color(0xFFfbfbfb),
            enabledBorder: AppInputBorders.borderless,
            focusedBorder: AppInputBorders.borderless,
          ),
          5.h,
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

          30.h,
          BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccessSendOtp) {
                Msg.show(context, state.message, type: MsgType.info);
                AppNavigator.pushNamed(
                  context,
                  AppRoutes.otp,
                  arguments: context.read<AuthCubit>(),
                );
              }
            },

            builder: (context, state) {
              if (state is AuthLoadingSignup) {
                return AppButton(
                  text: 'جاري التحميل',
                  isLoading: true,
                  backgroundColor: const Color(0xFFe62a50),
                );
              }
              return AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    context.read<AuthCubit>().signup(
                      username: phoneController.text,
                      email: emailController.text,
                      password: passwordController.text,
                    );
                  }
                },
                backgroundColor: const Color(0xFFe62a50),
                foregroundColor: Colors.white,
                text: 'إنشاء حساب', // ← ترجمة
              );
            },
          ),
        ],
      ),
    );
  }
}
