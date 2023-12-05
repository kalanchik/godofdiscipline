import 'package:flutter/material.dart';

class LevelInfo extends StatelessWidget {
  const LevelInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 360,
          height: 77,
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF00A7FF),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Column(
            children: [
              Row(
                children: [
                  Text(
                    'Уровень 10: Бог дисциплины',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Осталось: ',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '15 дней из 70 дней',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
