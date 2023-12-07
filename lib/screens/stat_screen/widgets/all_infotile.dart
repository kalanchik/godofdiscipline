import 'package:flutter/material.dart';

class AllInfotile extends StatelessWidget {
  final String title;
  final String info;
  const AllInfotile({
    super.key,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF798994),
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Color(0xFF798994),
          ),
        )
      ],
    );
  }
}
