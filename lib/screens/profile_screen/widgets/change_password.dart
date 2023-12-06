import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/pass_field.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          PassField(
            hint: 'Старый пароль',
          ),
          SizedBox(
            height: 8,
          ),
          PassField(
            hint: 'Новый пароль',
          ),
          SizedBox(
            height: 8,
          ),
          PassField(
            hint: 'Еще раз новый пароль',
          ),
        ],
      ),
    );
  }
}
