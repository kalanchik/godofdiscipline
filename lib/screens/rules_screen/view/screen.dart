import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/rules_screen/widgets/rules_card.dart';
import 'package:godofdiscipline/screens/rules_screen/widgets/text_rules_card.dart';

@RoutePage()
class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xFF798994),
        ),
        title: const Text(
          'Правила игры',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: Color(0xFF071A2F),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            TextRulesCard(),
            SizedBox(
              height: 9,
            ),
            RulesCard(
              icon: 'camera',
              title: 'Смотреть видеоинструкцию к игре',
            ),
            SizedBox(
              height: 9,
            ),
            RulesCard(
              icon: 'policy',
              title: 'Политика обработки персональных данных',
            ),
          ],
        ),
      ),
    );
  }
}
