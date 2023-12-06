import 'package:flutter/material.dart';

class DateTimeSelector extends StatelessWidget {
  const DateTimeSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 360,
          height: 84,
          padding: const EdgeInsets.symmetric(
            horizontal: 13,
            vertical: 14,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFBFDFC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 19,
                        width: 19,
                        child: Image.asset('assets/icons/calendar.png'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Выбрать дату',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Color(0xFF071A2F),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '2023/11/29',
                        style: TextStyle(
                          color: Color(0xFF071A2F),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 11,
                        height: 11,
                        child: Image.asset(
                          'assets/icons/arrow_right.png',
                        ),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 19,
                        width: 19,
                        child: Image.asset('assets/icons/timer.png'),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Text(
                        'Время',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 12,
                          color: Color(0xFF071A2F),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Нет',
                        style: TextStyle(
                          color: Color(0xFF071A2F),
                          fontSize: 12,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        width: 11,
                        height: 11,
                        child: Image.asset(
                          'assets/icons/arrow_right.png',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
