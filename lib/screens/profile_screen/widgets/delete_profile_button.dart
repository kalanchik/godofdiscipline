import 'package:flutter/material.dart';

class DeleteProfileButton extends StatelessWidget {
  const DeleteProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              SizedBox(
                height: 18,
                width: 18,
                child: Image.asset('assets/icons/trash.png'),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Удалить профиль',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFF69223),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
