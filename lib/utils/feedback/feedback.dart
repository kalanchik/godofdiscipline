import 'package:flutter/material.dart';

class AppFeedback {
  AppFeedback._();

  static void showFeedback({
    required BuildContext context,
    required bool isComplete,
    required String message,
  }) {
    final SnackBar snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      margin: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
      content: Text(message),
      backgroundColor: isComplete ? Colors.green : Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
