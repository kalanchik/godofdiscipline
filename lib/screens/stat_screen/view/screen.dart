import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/stat_screen/widgets/all_info_card.dart';
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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            LevelInfo(),
            SizedBox(
              height: 8,
            ),
            InfoCard(
              header: 'Сегодня',
              body: 'Выполнено:',
              bodyInfo: '5 заданий из 10',
              isAlert: true,
            ),
            SizedBox(
              height: 8,
            ),
            InfoCard(
              header: 'Завтра',
              body: 'Добавлено:',
              bodyInfo: '0 заданий из 10',
              isAlert: true,
            ),
            SizedBox(
              height: 8,
            ),
            InfoCard(
              header: 'Будущие даты',
              body: 'Добавлено:',
              bodyInfo: '12 заданий',
              isAlert: false,
            ),
            SizedBox(
              height: 69,
            ),
            AllInfoCard(),
          ],
        ),
      ),
    );
  }
}
