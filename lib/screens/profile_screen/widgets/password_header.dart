import 'package:flutter/material.dart';

class PasswordHeader extends StatelessWidget {
  const PasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Сменить пароль',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w400,
                color: Color(0xFF071A2F),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Если не хотите менять пароль, не заполняйте эти поля',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF798994),
              ),
            ),
          ],
        )
      ],
    );
  }
}
