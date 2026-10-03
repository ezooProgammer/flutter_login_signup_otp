class AppValidators {
  AppValidators._();

  static String? validateUsername(String? value) {
    // 1. التحقق من أن الحقل ليس فارغاً
    if (value == null || value.trim().isEmpty) {
      return 'يُرجى إدخال اسم المستخدم';
    }

    final username = value.trim();

    // 2. التحقق من الطول (مثلاً بين 3 و 20 حرف)
    if (username.length < 3) {
      return 'يجب أن لا يقل اسم المستخدم عن 3 أحرف';
    }

    if (username.length > 20) {
      return 'يجب أن لا يتجاوز اسم المستخدم 20 حرفاً';
    }

    // 3. التحقق من الصيغة (أحرف إنجليزية، أرقام، وشريطة سفلي _ فقط)
    final RegExp usernameRegExp = RegExp(r'^[a-zA-Z0-9_]+$');
    if (!usernameRegExp.hasMatch(username)) {
      return 'يسمح فقط بالحروف الإنجليزية، الأرقام، والشرطة السفلى (_)';
    }

    // 4. عدم البدء أو الانتهاء بشرطة سفلى (اختياري)
    if (username.startsWith('_') || username.endsWith('_')) {
      return 'لا يمكن أن يبدأ أو ينتهي اسم المستخدم بشرطة سفلى';
    }

    return null; // تعني أن المدخلات صحيحة وخالية من الأخطاء
  }

  // ============================================================
  // ===== التحقق من الحقول الفارغة =====
  // ============================================================

  /// التحقق من أن الحقل غير فارغ.
  static String? required(String? value, {String message = 'هذا الحقل مطلوب'}) {
    if (value == null || value.trim().isEmpty) {
      return message;
    }
    return null;
  }

  /// التحقق من أن الحقل غير فارغ مع حد أدنى من الأحرف.
  static String? requiredWithMinLength(
    String? value, {
    int minLength = 3,
    String? message,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.trim().length < minLength) {
      return message ?? 'يجب أن يكون $minLength أحرف على الأقل';
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من البريد الإلكتروني =====
  // ============================================================

  /// التحقق من صحة البريد الإلكتروني.
  static String? email(
    String? value, {
    String message = 'البريد الإلكتروني غير صحيح',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return message;
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من كلمة المرور =====
  // ============================================================

  /// التحقق من كلمة المرور (6 أحرف على الأقل).
  static String? password(String? value, {int minLength = 6}) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < minLength) {
      return 'كلمة المرور يجب أن تكون $minLength أحرف على الأقل';
    }
    return null;
  }

  /// التحقق من كلمة مرور قوية (حرف كبير + صغير + رقم + رمز).
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'يجب أن تحتوي على حرف كبير واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'يجب أن تحتوي على حرف صغير واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'يجب أن تحتوي على رقم واحد على الأقل';
    }
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'يجب أن تحتوي على رمز خاص واحد على الأقل';
    }
    return null;
  }

  /// التحقق من تطابق كلمتي المرور.
  static String? confirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) {
      return 'تأكيد كلمة المرور مطلوب';
    }
    if (value != password) {
      return 'كلمتا المرور غير متطابقتين';
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من رقم الهاتف =====
  // ============================================================

  /// التحقق من رقم الهاتف (عام).
  static String? phone(
    String? value, {
    String message = 'رقم الهاتف غير صحيح',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    final phoneRegex = RegExp(r'^[0-9+\-\s()]{8,15}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return message;
    }
    return null;
  }

  /// التحقق من رقم هاتف ليبي (مثال: 0912345678).
  static String? libyanPhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'رقم الهاتف مطلوب';
    }
    final regex = RegExp(r'^(09[1-6])\d{7}$');
    if (!regex.hasMatch(value.trim())) {
      return 'رقم الهاتف الليبي غير صحيح';
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من الأرقام =====
  // ============================================================

  /// التحقق من أن الحقل رقم.
  static String? number(String? value, {String message = 'يجب إدخال رقم'}) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (double.tryParse(value.trim()) == null) {
      return message;
    }
    return null;
  }

  /// التحقق من أن الرقم صحيح (Integer).
  static String? integer(
    String? value, {
    String message = 'يجب إدخال رقم صحيح',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (int.tryParse(value.trim()) == null) {
      return message;
    }
    return null;
  }

  /// التحقق من أن الرقم بين قيمتين.
  static String? numberInRange(
    String? value, {
    required double min,
    required double max,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    final number = double.tryParse(value.trim());
    if (number == null) {
      return 'يجب إدخال رقم';
    }
    if (number < min || number > max) {
      return 'يجب أن يكون الرقم بين $min و $max';
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من النصوص =====
  // ============================================================

  /// التحقق من أن النص لا يحتوي على أرقام.
  static String? noNumbers(
    String? value, {
    String message = 'لا يُسمح بالأرقام',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return message;
    }
    return null;
  }

  /// التحقق من أن النص يحتوي على أحرف فقط.
  static String? onlyLetters(
    String? value, {
    String message = 'يُسمح بالأحرف فقط',
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (!RegExp(r'^[a-zA-Z\u0600-\u06FF\s]+$').hasMatch(value.trim())) {
      return message;
    }
    return null;
  }

  /// التحقق من الاسم الكامل (حرفان على الأقل، بدون أرقام).
  static String? fullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'الاسم مطلوب';
    }
    if (value.trim().length < 3) {
      return 'الاسم يجب أن يكون 3 أحرف على الأقل';
    }
    if (value.contains(RegExp(r'[0-9]'))) {
      return 'الاسم لا يحتوي على أرقام';
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من الطول =====
  // ============================================================

  /// التحقق من الحد الأدنى للطول.
  static String? minLength(String? value, int min) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.trim().length < min) {
      return 'يجب أن يكون $min أحرف على الأقل';
    }
    return null;
  }

  /// التحقق من الحد الأقصى للطول.
  static String? maxLength(String? value, int max) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    if (value.trim().length > max) {
      return 'يجب ألا يتجاوز $max حرف';
    }
    return null;
  }

  /// التحقق من نطاق الطول.
  static String? lengthInRange(
    String? value, {
    required int min,
    required int max,
  }) {
    if (value == null || value.trim().isEmpty) {
      return 'هذا الحقل مطلوب';
    }
    final length = value.trim().length;
    if (length < min || length > max) {
      return 'يجب أن يكون الطول بين $min و $max حرف';
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من التواريخ =====
  // ============================================================

  /// التحقق من أن التاريخ ليس في الماضي.
  static String? notInPast(DateTime? date) {
    if (date == null) {
      return 'التاريخ مطلوب';
    }
    if (date.isBefore(DateTime.now())) {
      return 'التاريخ لا يمكن أن يكون في الماضي';
    }
    return null;
  }

  /// التحقق من أن المستخدم عمره 18 سنة على الأقل.
  static String? minimumAge(DateTime? birthDate, {int minAge = 18}) {
    if (birthDate == null) {
      return 'تاريخ الميلاد مطلوب';
    }
    final today = DateTime.now();
    final age = today.year - birthDate.year;
    final hasHadBirthdayThisYear =
        today.month > birthDate.month ||
        (today.month == birthDate.month && today.day >= birthDate.day);
    final actualAge = hasHadBirthdayThisYear ? age : age - 1;
    if (actualAge < minAge) {
      return 'يجب أن يكون عمرك $minAge سنة على الأقل';
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من الرابط =====
  // ============================================================

  /// التحقق من صحة رابط URL.
  static String? url(String? value, {String message = 'الرابط غير صحيح'}) {
    if (value == null || value.trim().isEmpty) {
      return 'الرابط مطلوب';
    }
    final urlRegex = RegExp(
      r'^(https?:\/\/)?([\w\-]+\.)+[\w\-]+(\/[\w\-.\/?%&=]*)?$',
    );
    if (!urlRegex.hasMatch(value.trim())) {
      return message;
    }
    return null;
  }

  // ============================================================
  // ===== التحقق من IBAN / بطاقة =====
  // ============================================================

  /// التحقق من رقم بطاقة الائتمان (16 رقم).
  static String? creditCard(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'رقم البطاقة مطلوب';
    }
    final cleaned = value.replaceAll(RegExp(r'\s'), '');
    if (!RegExp(r'^\d{16}$').hasMatch(cleaned)) {
      return 'رقم البطاقة يجب أن يكون 16 رقماً';
    }
    return null;
  }
}
