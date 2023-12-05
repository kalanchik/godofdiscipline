import 'package:flutter/material.dart';

class DayActionButton extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  const DayActionButton({
    super.key,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}
