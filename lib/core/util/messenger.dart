// lib/core/messenger.dart
import 'dart:async';
import 'package:flutter/material.dart';

enum MsgType { success, error, warning, info }

enum MsgPos { top, bottom }

class Msg {
  static OverlayEntry? _entry;
  static Timer? _timer;
  static Timer? _fadeTimer;
  static final ValueNotifier<double> _opacity = ValueNotifier(0);
  static final ValueNotifier<Offset> _offset = ValueNotifier(
    const Offset(0, -0.3),
  );

  static void show(
    BuildContext context,
    String text, {
    MsgType type = MsgType.info,
    MsgPos pos = MsgPos.top,
    Duration duration = const Duration(seconds: 2),
    Duration animDuration = const Duration(milliseconds: 200),
  }) {
    // تنظيف فوري
    _timer?.cancel();
    _fadeTimer?.cancel();

    final isNew = _entry == null;
    if (isNew) {
      final overlay = Overlay.of(context);
      final media = MediaQuery.of(context);
      final top = media.padding.top + 12;
      final bottom = media.padding.bottom + 12;

      _entry = OverlayEntry(
        builder: (_) => _Bubble(
          opacity: _opacity,
          offset: _offset,
          top: pos == MsgPos.top ? top : null,
          bottom: pos == MsgPos.bottom ? bottom : null,
        ),
      );
      overlay.insert(_entry!);
    }

    // تحديث المحتوى
    _currentText.value = text;
    _currentColor.value = _colorOf(type);
    _currentIcon.value = _iconOf(type);

    // Fade In
    _opacity.value = 1;
    _offset.value = Offset.zero;

    // Fade Out ثم إزالة
    _timer = Timer(duration, () async {
      _opacity.value = 0;
      _offset.value = pos == MsgPos.top
          ? const Offset(0, -0.3)
          : const Offset(0, 0.3);

      _fadeTimer = Timer(animDuration, () {
        _entry?.remove();
        _entry = null;
      });
    });
  }

  static Color _colorOf(MsgType t) => switch (t) {
    MsgType.success => const Color(0xFF10B981),
    MsgType.error => const Color(0xFFEF4444),
    MsgType.warning => const Color(0xFFF59E0B),
    MsgType.info => const Color(0xFF3B82F6),
  };

  static IconData _iconOf(MsgType t) => switch (t) {
    MsgType.success => Icons.check_circle_rounded,
    MsgType.error => Icons.error_rounded,
    MsgType.warning => Icons.warning_rounded,
    MsgType.info => Icons.info_rounded,
  };

  // محتوى الرسالة الحالي
  static final ValueNotifier<String> _currentText = ValueNotifier('');
  static final ValueNotifier<Color> _currentColor = ValueNotifier(
    const Color(0xFF3B82F6),
  );
  static final ValueNotifier<IconData> _currentIcon = ValueNotifier(
    Icons.info_rounded,
  );
}

class _Bubble extends StatelessWidget {
  final ValueNotifier<double> opacity;
  final ValueNotifier<Offset> offset;
  final double? top;
  final double? bottom;

  const _Bubble({
    required this.opacity,
    required this.offset,
    this.top,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: 16,
      right: 16,
      child: ValueListenableBuilder<double>(
        valueListenable: opacity,
        builder: (_, op, __) => ValueListenableBuilder<Offset>(
          valueListenable: offset,
          builder: (_, off, __) => AnimatedSlide(
            offset: off,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOut,
            child: AnimatedOpacity(
              opacity: op,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: ValueListenableBuilder<Color>(
                valueListenable: Msg._currentColor,
                builder: (_, color, __) => ValueListenableBuilder<IconData>(
                  valueListenable: Msg._currentIcon,
                  builder: (_, icon, __) => ValueListenableBuilder<String>(
                    valueListenable: Msg._currentText,
                    builder: (_, text, __) => Material(
                      color: Colors.transparent,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(.3),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Icon(icon, color: Colors.white, size: 22),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                text,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
