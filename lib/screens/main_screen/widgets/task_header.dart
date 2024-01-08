import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TaskHeader extends StatelessWidget {
  final bool isComplete;
  const TaskHeader({super.key, required this.isComplete});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: isComplete ? const Color(0xFF54D650) : null,
              border: isComplete
                  ? null
                  : Border.all(
                      width: 2,
                      color: const Color(0xFFD3D8DC),
                    ),
              shape: BoxShape.circle,
            ),
            child: isComplete
                ? const Icon(
                    Icons.done,
                    size: 15,
                    color: Colors.white,
                  )
                : null,
          ),
        ),
        const SizedBox(
          width: 16,
        ),
        const Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Чтение 60 минут',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF071A2F),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      'Алмазный огранщик',
                      style: TextStyle(
                        color: Color(0xFF071A2F),
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Row(
          children: [
            Text(
              '06:00',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isComplete
                    ? const Color(0xFF798994)
                    : const Color(0xFFEA0001),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 15,
              height: 15,
              child: SvgPicture.asset('assets/icons/bell.svg'),
            )
          ],
        ),
      ],
    );
  }
}
