import 'package:flutter/material.dart';

class AppFeedback {
  AppFeedback._();

  static void showFeedback({
    required BuildContext context,
    required bool isComplete,
    required String message,
  }) {
    final SnackBar snackBar = SnackBar(
      content: Text(message),
      backgroundColor: isComplete ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
