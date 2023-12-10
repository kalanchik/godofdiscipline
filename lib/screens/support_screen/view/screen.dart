import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xFF798994),
        ),
        title: const Text(
          'Написать в техподдержку',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: Color(0xFF071A2F),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SupportCard(
              hight: 50,
              hintText: 'Тема письма',
            ),
            const SizedBox(
              height: 13,
            ),
            const SupportCard(
              hight: 272,
              hintText: 'Текст письма',
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 45,
                    width: 177,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00A7FF),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: const Center(
                      child: Text(
                        'Отправить',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SupportCard extends StatelessWidget {
  final double hight;
  final String hintText;
  const SupportCard({
    super.key,
    required this.hight,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: hight,
              padding: const EdgeInsets.symmetric(
                horizontal: 11,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: const Color(0xFFFBFDFC),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        hintText,
                        style: const TextStyle(
                          color: Color(0xFF798994),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
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
