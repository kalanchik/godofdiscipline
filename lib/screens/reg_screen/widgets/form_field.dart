import 'package:flutter/material.dart';

class TFormField extends StatelessWidget {
  final String hintText;
  const TFormField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 45,
      decoration: BoxDecoration(
        color: const Color(0xFFFBFDFC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(15),
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF798994),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
