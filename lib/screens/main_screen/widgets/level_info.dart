import 'package:flutter/material.dart';
import 'package:godofdiscipline/models/level/level.dart';

class LevelInfo extends StatelessWidget {
  const LevelInfo({
    super.key,
    required this.level,
  });

  final Level level;

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
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Уровень ${level.levelIndex}: ${level.levelName}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const Text(
                    'Осталось: ',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '${level.leftDay} дней из ${level.levelLenght} дней',
                    style: const TextStyle(
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
