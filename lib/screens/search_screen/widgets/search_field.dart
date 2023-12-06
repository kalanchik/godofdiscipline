import 'package:flutter/material.dart';

class SerchField extends StatelessWidget {
  const SerchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 367,
          height: 39,
          padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 7),
          decoration: BoxDecoration(
            color: const Color(0xFFD3D8DC),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              SizedBox(
                height: 25,
                width: 25,
                child: Image.asset(
                  'assets/icons/search.png',
                  color: const Color(0xFF798994),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              const Text(
                'Найти',
                style: TextStyle(
                  color: Color(0xFF798994),
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
