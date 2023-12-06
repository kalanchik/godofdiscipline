import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/info_tile.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 172,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFBFDFC),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: Image.asset(
                        'assets/icons/avatar.png',
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    const Text(
                      'Иванов Иван',
                      style: TextStyle(
                        color: Color(0xFF071A2F),
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const InfoTile(
                  header: 'Текущий статус:',
                  body: 'Бог дисциплины',
                ),
                const SizedBox(
                  height: 4,
                ),
                const InfoTile(
                  header: 'Начало периода:',
                  body: 'с 12.05.2023',
                ),
                const SizedBox(
                  height: 4,
                ),
                const InfoTile(
                  header: 'Осталось в периоде:',
                  body: '300 дней',
                ),
                const SizedBox(
                  height: 4,
                ),
                const InfoTile(
                  header: 'Сегодня выполнено:',
                  body: '6 заданий из 10',
                ),
                const SizedBox(
                  height: 4,
                ),
                const InfoTile(
                  header: 'Завтра:',
                  body: 'добавлено 1 задание из 10',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
