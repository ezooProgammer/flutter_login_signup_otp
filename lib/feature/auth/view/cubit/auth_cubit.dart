import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // ===== تسجيل الدخول =====
  Future<void> login({required String email, required String password}) async {
    emit(AuthLoadingLogin());
    Future.delayed(Duration(seconds: 3));
    try {
      emit(AuthSuccessLogin('تم تسجيل دخول بنجاح'));
    } catch (e) {
      emit(AuthErrorLogin('حدث خطأ: ${e.toString()}'));
    }
  }

  Future<void> signup({required String username , required String email, required String password}) async {
    emit(AuthLoadingSignup());
    Future.delayed(Duration(seconds: 3));
    try {
      emit(AuthSuccessSendOtp('تم إرسال رمز تحقق' , phoneNumber: '0928292482'));
    } catch (e) {
      emit(AuthErrorSignup('حدث خطأ: ${e.toString()}'));
    }
  }

  // ===== إعادة التعيين =====
  void reset() {
    emit(AuthInitial());
  }
}
