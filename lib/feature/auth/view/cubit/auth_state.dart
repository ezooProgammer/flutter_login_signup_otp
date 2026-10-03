// ===== الحالة الأساسية =====
abstract class AuthState {}

// ===== الحالة الابتدائية =====
class AuthInitial extends AuthState {}

// ===== حالة التحميل =====
class AuthLoadingLogin extends AuthState {}
class AuthLoadingSignup extends AuthState {}

// --- حالات التحميل الخاصة بالـ OTP ---
class AuthLoadingSendOtp extends AuthState {}
class AuthLoadingVerifyOtp extends AuthState {}
class AuthLoadingResendOtp extends AuthState {}

// ===== حالة النجاح =====
class AuthSuccessLogin extends AuthState {
  final String message;
  AuthSuccessLogin(this.message);
}

class AuthSuccessSignup extends AuthState {
  final String message;
  AuthSuccessSignup(this.message);
}

// --- حالات النجاح الخاصة بالـ OTP ---
class AuthSuccessSendOtp extends AuthState {
  final String message;
  final String? phoneNumber; // اختياري: لتمرير رقم الهاتف للشاشة التالية
  AuthSuccessSendOtp(this.message, {this.phoneNumber});
}

class AuthSuccessVerifyOtp extends AuthState {
  final String message;
  final dynamic userData; // اختياري: لتمرير بيانات المستخدم أو التوكن بعد التحقق الناجح
  AuthSuccessVerifyOtp(this.message, {this.userData});
}

class AuthSuccessResendOtp extends AuthState {
  final String message;
  AuthSuccessResendOtp(this.message);
}

// ===== حالة الخطأ =====
class AuthErrorLogin extends AuthState {
  final String message;
  AuthErrorLogin(this.message);
}

class AuthErrorSignup extends AuthState {
  final String message;
  AuthErrorSignup(this.message);
}

// --- حالات الخطأ الخاصة بالـ OTP ---
class AuthErrorSendOtp extends AuthState {
  final String message;
  AuthErrorSendOtp(this.message);
}

class AuthErrorVerifyOtp extends AuthState {
  final String message;
  AuthErrorVerifyOtp(this.message);
}

class AuthErrorResendOtp extends AuthState {
  final String message;
  AuthErrorResendOtp(this.message);
}

// ===== حالة تسجيل الخروج =====
class AuthLoggedOut extends AuthState {}