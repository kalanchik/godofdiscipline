import 'package:flutter/material.dart';

class TElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const TElevatedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 13,
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
    );
  }
}
