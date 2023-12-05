import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/form_field.dart';

class RegBody extends StatelessWidget {
  const RegBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TFormField(
          hintText: 'Имя',
        ),
        SizedBox(
          height: 8,
        ),
        TFormField(
          hintText: 'Фамилия',
        ),
        SizedBox(
          height: 8,
        ),
        TFormField(
          hintText: 'E-mail',
        ),
        SizedBox(
          height: 8,
        ),
        TFormField(
          hintText: 'Пароль',
        ),
        SizedBox(
          height: 8,
        ),
        TFormField(
          hintText: 'Повторите пароль',
        ),
        SizedBox(
          height: 24,
        ),
        Text(
          'Забыли пароль?',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF071A2F),
          ),
        ),
      ],
    );
  }
}
