import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: const Color(0xFFF0F4F7),
      backgroundColor: const Color(0xFF00A7FF),
      disabledBackgroundColor: const Color(0xFFF0F4F7),
      disabledForegroundColor: const Color(0xFFF0F4F7),
      side: const BorderSide(width: 0, color: Colors.transparent),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 17,
        color: Color(0xFFFFFFFF),
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
