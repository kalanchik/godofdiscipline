import 'package:flutter/material.dart';

class RulesCard extends StatelessWidget {
  final String icon;
  final String title;
  const RulesCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFFBFDFC),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 17,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SizedBox(
                          height: 17,
                          width: 17,
                          child: Image.asset('assets/icons/$icon.png'),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Flexible(
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF071A2F),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    height: 11,
                    width: 11,
                    child: Image.asset('assets/icons/arrow_right.png'),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
