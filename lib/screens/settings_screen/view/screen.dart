import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xFF798994),
        ),
        title: const Text(
          'Настройки',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: Color(0xFF071A2F),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              MuteCard(),
              SizedBox(
                height: 8,
              ),
              SystemCard(),
              SizedBox(
                height: 8,
              ),
              ExitCard(
                header: 'Выйти из аккаунта',
                icon: 'exit',
              ),
              SizedBox(
                height: 8,
              ),
              ExitCard(
                header: 'Выйти со всех устройств',
                icon: 'phone',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExitCard extends StatelessWidget {
  final String header;
  final String icon;
  const ExitCard({super.key, required this.header, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFBFDFC),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 17,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                          height: 18,
                          child: Image.asset(
                            'assets/icons/$icon.png',
                            color: const Color(0xFF798994),
                          ),
                        ),
                        const SizedBox(
                          width: 9,
                        ),
                        Text(
                          header,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xFF071A2F),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 11,
                      width: 11,
                      child: Image.asset('assets/icons/arrow_right.png'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SystemCard extends StatelessWidget {
  const SystemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFBFDFC),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 17,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: Image.asset(
                        'assets/icons/settings.png',
                        color: const Color(0xFF798994),
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      'Системные настройки',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF071A2F),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  children: [
                    Flexible(
                      child: Text(
                        'При необходимости проверьте, корректно ли настроены получение и звук уведомлений',
                        style: TextStyle(
                          color: Color(0xFF798994),
                          fontSize: 10,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Перейти в настройки'),
                    SizedBox(
                      height: 11,
                      width: 11,
                      child: Image.asset('assets/icons/arrow_right.png'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class MuteCard extends StatelessWidget {
  const MuteCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFBFDFC),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 17,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 18,
                      height: 18,
                      child: Image.asset('assets/icons/mute.png'),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    const Text(
                      'Режим "Не беспокоить"',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Color(0xFF071A2F),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                const Row(
                  children: [
                    Text(
                      'Когда режим включен, перестают приходить все уведомления',
                      style: TextStyle(
                        color: Color(0xFF798994),
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 22,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Режим "Не беспокоить"'),
                    SizedBox(
                      height: 21,
                      width: 39,
                      child: Switch.adaptive(
                        value: false,
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
