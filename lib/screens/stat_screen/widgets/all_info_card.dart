import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/stat_screen/widgets/all_infotile.dart';

class AllInfoCard extends StatelessWidget {
  const AllInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 11,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFBFDFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Всего',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF071A2F),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  AllInfotile(
                    title: 'Добавлено:',
                    info: '3421 задание',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  AllInfotile(
                    title: 'Выполнено:',
                    info: '3401 задание',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  AllInfotile(
                    title: 'Время игры:',
                    info: '1 год 3 месяца 12 дней',
                  ),
                  SizedBox(
                    height: 9,
                  ),
                  AllInfotile(
                    title: 'Дата начала игры:',
                    info: '12.05.2023 г',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
