import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godofdiscipline/models/task/task.dart';

class FindTaskTile extends StatelessWidget {
  const FindTaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 15,
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFFBFDFC),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: task.isComplete == TaskStatus.complete
                    ? const Color(0xFF54D650)
                    : null,
                border: task.isComplete == TaskStatus.complete
                    ? null
                    : Border.all(
                        width: 2,
                        color: const Color(0xFFD3D8DC),
                      ),
                shape: BoxShape.circle,
              ),
              child: task.isComplete == TaskStatus.complete
                  ? const Icon(
                      Icons.done,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          task.title,
                          style: const TextStyle(
                            fontSize: 17,
                            decorationThickness: 0.5,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF071A2F),
                          ),
                        ),
                      ),
                    ],
                  ),
                  task.desc.isNotEmpty
                      ? Row(
                          children: [
                            Flexible(
                              child: Text(
                                task.desc,
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
                      : const SizedBox.shrink(),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  task.startTime,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: task.isComplete == TaskStatus.complete
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
        ),
      ),
    );
  }
}
