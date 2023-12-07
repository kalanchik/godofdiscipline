import 'package:flutter/material.dart';

class TextRulesCard extends StatelessWidget {
  const TextRulesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 20,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFBFDFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Краткое описание игры.',
                style: TextStyle(
                  color: Color(0xFF071A2F),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
