import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/pass_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({
    super.key,
    required this.oldPassCtrl,
    required this.newPassCtrl,
    required this.newPassVerCtrl,
  });

  final TextEditingController oldPassCtrl;
  final TextEditingController newPassCtrl;
  final TextEditingController newPassVerCtrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          PassField(
            hint: 'Старый пароль',
            controller: oldPassCtrl,
          ),
          const SizedBox(
            height: 8,
          ),
          PassField(
            hint: 'Новый пароль',
            controller: newPassCtrl,
          ),
          const SizedBox(
            height: 8,
          ),
          PassField(
            hint: 'Еще раз новый пароль',
            controller: newPassVerCtrl,
          ),
        ],
      ),
    );
  }
}
