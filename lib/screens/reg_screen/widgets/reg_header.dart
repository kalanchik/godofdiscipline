import 'package:flutter/material.dart';

class RegHeader extends StatelessWidget {
  const RegHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 360,
              height: 77,
              decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Бог дисциплины',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 19,
                        ),
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Игра, органайзер и планировщик событий',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          width: 360,
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              children: [
                TextSpan(
                  text:
                      'Для того чтобы воспользоваться всеми возможностями игры, вам необходимо зарегистрироваться. Регистрируясь, вы соглашаетесь с',
                  style: TextStyle(
                    color: Color(0xFF798994),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
                TextSpan(
                  text: ' Политикой обработки персональных данных',
                  style: TextStyle(
                    color: Color(0xFF00A7FF),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
                TextSpan(
                  text: ' и',
                  style: TextStyle(
                    color: Color(0xFF798994),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
                TextSpan(
                  text: ' Правилами игры',
                  style: TextStyle(
                    color: Color(0xFF00A7FF),
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
