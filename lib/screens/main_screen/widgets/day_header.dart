import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_action_button.dart';

class DayHeader extends StatefulWidget {
  const DayHeader({super.key});

  @override
  State<DayHeader> createState() => _DayHeaderState();
}

class _DayHeaderState extends State<DayHeader> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'Сегодня',
                style: TextStyle(
                  color: Color(0xFF798994),
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 18,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: SizedBox(
                  height: 13,
                  width: 13,
                  child: Image.asset('assets/icons/down_arrow.png'),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            curve: Curves.fastEaseInToSlowEaseOut,
            child: isOpen
                ? const Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DayActionButton(
                            backgroundColor: Color(0xFFB6DCF1),
                            textColor: Color(0xFF108EE6),
                            text: 'Добавить:1',
                          ),
                          DayActionButton(
                            backgroundColor: Color(0xFF54D650),
                            textColor: Colors.white,
                            text: 'Выполнено:5',
                          ),
                          DayActionButton(
                            backgroundColor: Color(0xFFEA0001),
                            textColor: Colors.white,
                            text: 'Осталось:4',
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 21,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }
}
