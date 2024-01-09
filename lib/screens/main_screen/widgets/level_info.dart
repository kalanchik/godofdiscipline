import 'package:flutter/material.dart';
import 'package:godofdiscipline/models/statistics/statistics.dart';

class LevelInfo extends StatelessWidget {
  final LevelsNames userLevel;
  const LevelInfo({super.key, required this.userLevel});

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
                    'Уровень ${userLevel.index + 1}: ${buildLevelName(userLevel.index + 1)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              const Row(
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
                    '0 дней из 14 дней',
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

String buildLevelName(int levelIndex) {
  final levelsNames = <int, String>{
    1: 'Легко',
    2: 'Я могу',
    3: 'Я могу больше',
    4: 'Я крутой',
  };
  final levelName = levelsNames[levelIndex];
  if (levelName == null) return 'Легко';
  return levelName;
}
