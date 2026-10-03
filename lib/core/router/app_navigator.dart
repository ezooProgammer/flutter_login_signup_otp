import 'package:flutter/material.dart';


class AppNavigator {
  AppNavigator._(); 

  // ============================================================
  // ===== الانتقال العادي (Push) =====
  // ============================================================

  /// الانتقال إلى شاشة جديدة باستخدام اسم الراوت.
  static Future<dynamic> pushNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  /// الانتقال إلى شاشة جديدة باستخدام Widget مباشرة.
  static Future<dynamic> push(
    BuildContext context,
    Widget page,
  ) {
    return Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // ============================================================
  // ===== استبدال الشاشة (Push Replacement) =====
  // ============================================================

  /// استبدال الشاشة الحالية بشاشة جديدة (لا يمكن الرجوع).
  static Future<dynamic> pushReplacementNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushReplacementNamed(
      context,
      routeName,
      arguments: arguments,
    );
  }

  /// استبدال الشاشة الحالية بـ Widget مباشرة.
  static Future<dynamic> pushReplacement(
    BuildContext context,
    Widget page,
  ) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  // ============================================================
  // ===== حذف كل الشاشات والانتقال (Push And Remove) =====
  // ============================================================

  /// حذف كل الشاشات والانتقال إلى شاشة جديدة.
  static Future<dynamic> pushAndRemoveUntilNamed(
    BuildContext context,
    String routeName, {
    Object? arguments,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      context,
      routeName,
      (route) => false,  // ← حذف كل الشاشات السابقة
      arguments: arguments,
    );
  }

  /// حذف كل الشاشات والانتقال إلى Widget مباشرة.
  static Future<dynamic> pushAndRemoveUntil(
    BuildContext context,
    Widget page,
  ) {
    return Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => page),
      (route) => false,
    );
  }

  // ============================================================
  // ===== الرجوع (Pop) =====
  // ============================================================

  /// الرجوع إلى الشاشة السابقة.
  static void pop(BuildContext context, {dynamic result}) {
    Navigator.pop(context, result);
  }

  /// الرجوع إلى شاشة معينة.
  static void popUntil(BuildContext context, String routeName) {
    Navigator.popUntil(context, ModalRoute.withName(routeName));
  }

  /// الرجوع مع نتيجة (لتمرير البيانات للشاشة السابقة).
  static void popWithResult(BuildContext context, dynamic result) {
    Navigator.pop(context, result);
  }

  // ============================================================
  // ===== التحقق =====
  // ============================================================

  /// هل يمكن الرجوع إلى الشاشة السابقة؟
  static bool canPop(BuildContext context) {
    return Navigator.canPop(context);
  }
}