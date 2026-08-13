import 'package:flutter/material.dart';

/// Tema do app — azul/roxo celestial (fé, esperança, adoração).
class AppTheme {
  AppTheme._();

  static const brand = Color(0xFF5B4FE9); // índigo/roxo
  static const brandDark = Color(0xFF3A2FB0);
  static const gold = Color(0xFFB9C6FF);

  /// Gradiente da "frase do dia" e da marca.
  static const hero = [Color(0xFF4776E6), Color(0xFF8E54E9)];

  static LinearGradient gradient(List<Color> colors) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
      );

  static ThemeData light([Color accent = brand]) {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.light),
      scaffoldBackgroundColor: const Color(0xFFF4F5FF),
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }

  static ThemeData dark([Color accent = brand]) {
    return ThemeData(
      useMaterial3: true,
      colorScheme:
          ColorScheme.fromSeed(seedColor: accent, brightness: Brightness.dark),
      scaffoldBackgroundColor: const Color(0xFF0E0F1E),
      appBarTheme: const AppBarTheme(centerTitle: false),
    );
  }
}
