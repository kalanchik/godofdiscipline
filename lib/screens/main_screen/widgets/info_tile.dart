import 'package:flutter/material.dart';

class InfoTile extends StatelessWidget {
  final String header;
  final String body;
  const InfoTile({
    super.key,
    required this.header,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          header,
          style: const TextStyle(
            color: Color(0xFF798994),
            fontSize: 10,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          body,
          style: const TextStyle(
            color: Color(0xFF798994),
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
