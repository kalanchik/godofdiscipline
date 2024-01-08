import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/form_field.dart';

class RegBody extends StatelessWidget {
  final TextEditingController firstNameCtrl;
  final TextEditingController lastNameCtrl;
  final TextEditingController emailCtrl;
  final TextEditingController passCtrl;
  final TextEditingController passVerCtrl;
  final GlobalKey formKey;
  const RegBody({
    super.key,
    required this.firstNameCtrl,
    required this.lastNameCtrl,
    required this.emailCtrl,
    required this.passCtrl,
    required this.passVerCtrl,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          TFormField(
            controller: firstNameCtrl,
            hintText: 'Имя',
            action: TextInputAction.next,
          ),
          const SizedBox(
            height: 8,
          ),
          TFormField(
            controller: lastNameCtrl,
            hintText: 'Фамилия',
            action: TextInputAction.next,
          ),
          const SizedBox(
            height: 8,
          ),
          TFormField(
            controller: emailCtrl,
            hintText: 'E-mail',
            action: TextInputAction.next,
          ),
          const SizedBox(
            height: 8,
          ),
          TFormField(
            controller: passCtrl,
            hintText: 'Пароль',
            isPassword: true,
            action: TextInputAction.next,
          ),
          const SizedBox(
            height: 8,
          ),
          TFormField(
            controller: passVerCtrl,
            hintText: 'Повторите пароль',
            isPassword: true,
            action: TextInputAction.done,
          ),
          const SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
