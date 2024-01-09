import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godofdiscipline/models/task/task.dart';

class TaskHeader extends StatelessWidget {
  const TaskHeader({
    super.key,
    required this.isComplete,
    required this.title,
    required this.desc,
    required this.time,
    required this.changeStatus,
    required this.status,
  });

  final bool isComplete;
  final String title;
  final String desc;
  final String time;
  final TaskStatus status;
  final void Function() changeStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: changeStatus,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: status == TaskStatus.complete
                  ? const Color(0xFF54D650)
                  : null,
              border: status == TaskStatus.complete
                  ? null
                  : Border.all(
                      width: 2,
                      color: const Color(0xFFD3D8DC),
                    ),
              shape: BoxShape.circle,
            ),
            child: status == TaskStatus.complete
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
        Expanded(
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      title,
                      style: const TextStyle(
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
                      desc,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
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
              time,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: status == TaskStatus.complete
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
