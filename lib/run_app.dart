import 'package:app_test/core/router/app_router.dart';
import 'package:app_test/core/router/app_routes.dart' show AppRoutes;
import 'package:app_test/core/theme/theme_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart'
    show
        GlobalWidgetsLocalizations,
        GlobalMaterialLocalizations,
        GlobalCupertinoLocalizations;

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeApp.themeApp(),
      initialRoute: AppRoutes.login,
      onGenerateRoute: AppRouter.onGenerateRoute,
      locale: const Locale('ar'),
      // ===== دعم اللغات =====
      supportedLocales: const [
        Locale('ar'), // العربية
        Locale('en'), // الإنجليزية
      ],
      // ===== المندوبين (Delegates) =====
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
