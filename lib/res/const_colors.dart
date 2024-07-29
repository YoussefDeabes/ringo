import 'dart:math';

import 'package:flutter/material.dart';

class ConstColors {

  static final MaterialColor primarySwatch = generateMaterialColors(app);
  static const Color app = Color(0xFF191D2B);
  static const Color scaffoldBackground = Color(0xFFF3F3F3);
  static const Color shadowColor = Color(0xFFE8EAEE);
  static const Color blue = Color(0xFF5599F5);
  static const Color orange = Color(0xFFFD7722);
  static const Color lightOrange = Color(0xFFFEDFCC);
  static const Color pink = Color(0xFFE84C88);
  static const Color green = Color(0xFF5ECEB3);
  static const Color lightGreen = Color(0xFFEBF9F5);
  static const Color purple = Color(0xFFD08CDF);
  static const Color lightPurple = Color(0xFFF9F1FB);
  static const Color grey = Color(0x191C2A1F);
  static const Color white = Colors.white;

  static const Color text = Color(0xFF191D2B);
  static const Color secondaryText = Color(0xFF96A0B5);
  static const Color taskDue = Color(0xFF697896);
  static const Color calendarDisabled = Color(0xFFD0D5DC);
  static const Color textDisabled = Color(0xFFE0E0E0);
  static const Color disabled = Color(0xFFE0E0E0);
  static const Color accent = Color(0xFF7FCED6);
  static const Color greyLight = Color(0xFFF5F5F5);

}

MaterialColor generateMaterialColors(Color color) {
  return MaterialColor(color.value, {
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor),
    tintValue(color.green, factor),
    tintValue(color.blue, factor),
    1);

int shadeValue(int value, double factor) =>
    max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(
    shadeValue(color.red, factor),
    shadeValue(color.green, factor),
    shadeValue(color.blue, factor),
    1);

/**
    Hexadecimal opacity values
    100% — FF
    95% — F2
    90% — E6
    85% — D9
    80% — CC
    75% — BF
    70% — B3
    65% — A6
    60% — 99
    55% — 8C
    50% — 80
    45% — 73
    40% — 66
    35% — 59
    30% — 4D
    25% — 40
    20% — 33
    15% — 26
    10% — 1A
    5% — 0D
    0% — 00
 */
