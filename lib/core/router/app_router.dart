import 'package:app_test/core/router/app_routes.dart';
import 'package:app_test/feature/auth/view/screen/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/auth/view/cubit/auth_cubit.dart';
import '../../feature/auth/view/screen/login_screen.dart';
import '../../feature/auth/view/screen/signup_screen.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginScreen(),
          ),
          settings: settings,
        );

      case AppRoutes.signup:
        final authCubit = settings.arguments as AuthCubit;
        return MaterialPageRoute(
          builder: (_) =>
              BlocProvider.value(value: authCubit, child: const SignupScreen()),
          settings: settings,
        );

      case AppRoutes.otp:
        final authCubit = settings.arguments as AuthCubit;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: authCubit,
            child: const OtpScreen(),
            
          ),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
