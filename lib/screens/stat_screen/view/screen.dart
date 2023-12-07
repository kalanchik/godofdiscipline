import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/stat_screen/widgets/info_card.dart';
import 'package:godofdiscipline/screens/stat_screen/widgets/level_info.dart';

@RoutePage()
class StatScreen extends StatelessWidget {
  const StatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xFF798994),
        ),
        title: const Text(
          'Статистика',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 19,
            color: Color(0xFF071A2F),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LevelInfo(),
            const SizedBox(
              height: 8,
            ),
            const InfoCard(
              header: 'Сегодня',
              body: 'Выполнено:',
              bodyInfo: '5 заданий из 10',
              isAlert: true,
            ),
            const SizedBox(
              height: 8,
            ),
            const InfoCard(
              header: 'Завтра',
              body: 'Добавлено:',
              bodyInfo: '0 заданий из 10',
              isAlert: true,
            ),
            const SizedBox(
              height: 8,
            ),
            const InfoCard(
              header: 'Будущие даты',
              body: 'Добавлено:',
              bodyInfo: '12 заданий',
              isAlert: false,
            ),
            const SizedBox(
              height: 69,
            ),
            Padding(
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
            ),
          ],
        ),
      ),
    );
  }
}

class AllInfotile extends StatelessWidget {
  final String title;
  final String info;
  const AllInfotile({
    super.key,
    required this.title,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color(0xFF798994),
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Color(0xFF798994),
          ),
        )
      ],
    );
  }
}
