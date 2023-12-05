import 'package:flutter/material.dart';
import 'package:godofdiscipline/utils/theme/custom_theme/elevated_button.dart';
import 'package:godofdiscipline/utils/theme/custom_theme/outlinebutton_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'FiraSans',
    primaryColor: const Color(0xFF00A7FF),
    scaffoldBackgroundColor: const Color(0xFFF0F4F7),
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
  );
}

bool isLight(BuildContext context) {
  final theme = Theme.of(context);
  return theme.brightness == Brightness.light;
}
