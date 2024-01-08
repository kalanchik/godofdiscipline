import 'package:flutter/material.dart';

class TFormField extends StatelessWidget {
  final String hintText;
  final bool isPassword;
  final TextEditingController controller;
  final TextInputAction? action;
  const TFormField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    required this.controller,
    required this.action,
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
        textInputAction: action,
        controller: controller,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: isPassword,
        validator: (value) {
          if (value == null) return null;
          if (value.isEmpty) {
            return 'Поле не может быть пустым';
          }
          return null;
        },
        cursorColor: Theme.of(context).primaryColor,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(
            left: 16,
            bottom: 8,
            right: 16,
          ),
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
