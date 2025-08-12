import 'package:flutter/material.dart';
class AppTheme {
  static const _indigo = Color(0xFF6C5CE7);
  static const _teal = Color(0xFF00D1B2);
  static const _bg = Color(0xFF0F1220);
  static const _surface = Color(0xFF171A2B);
  static ThemeData get dark {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      scaffoldBackgroundColor: _bg,
      colorScheme: base.colorScheme.copyWith(primary: _indigo, secondary: _teal),
      appBarTheme: const AppBarTheme(backgroundColor: _bg, elevation: 0),
      cardTheme: const CardTheme(color: _surface, elevation: 1, shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        backgroundColor: _indigo, foregroundColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 18),
      )),
    );
  }
  static ThemeData get light => ThemeData.light(useMaterial3: true);
}
