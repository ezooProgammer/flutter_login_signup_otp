class AppRoutes {
  AppRoutes._(); // منع إنشاء كائنات

  static const String splash = '/';

  /// شاشة تسجيل الدخول.
  static const String login = '/login';

  /// شاشة إنشاء حساب.
  static const String signup = '/signup';
  

  static const String otp    = '/otp'; 

  /// شاشة نسيت كلمة المرور.
  static const String forgotPassword = '/forgot-password';

  /// الشاشة الرئيسية.
  static const String home = '/home';

}