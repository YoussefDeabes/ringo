import 'package:flutter/material.dart';
import 'package:ringo/res/const_colors.dart';
import 'package:ringo/util/lang/app_localization.dart';

class AppTheme {
  final Locale locale;
  const AppTheme(this.locale);

  ThemeData get themeDataLight {
    return ThemeData(
        primarySwatch: ConstColors.primarySwatch,
        fontFamily: 'Urbanist',
        useMaterial3: false,
        scaffoldBackgroundColor: ConstColors.white);
  }
}
