import 'package:flutter/material.dart';

class LastRequests extends StatelessWidget {
  const LastRequests({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Row(
            children: [
              Text(
                'Последние поисковые запросы',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xFF798994),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 11,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBFDFC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ...List.generate(
                        4,
                        (index) => Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'День рождения',
                                style: TextStyle(
                                  color: Color(0xFF798994),
                                ),
                              ),
                              SizedBox(
                                height: 13,
                                width: 13,
                                child: Image.asset('assets/icons/close.png'),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 29,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Очистить журнал поиска',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF00A7FF),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
