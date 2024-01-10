import 'package:flutter/material.dart';
import 'package:godofdiscipline/models/levelday/levelday.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_header.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/empty_task_tile.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/task_tile.dart';

class DayContent extends StatelessWidget {
  const DayContent({super.key, required this.levelDay});

  final LevelDay levelDay;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          DayHeader(
            dayDate: levelDay.dateDay,
            needToAdd: levelDay.calcHowToAdd(),
            completeTasks: levelDay.calcHowToComplete(),
            remToDone: levelDay.calcHoToRemain(),
            levelDay: levelDay,
          ),
          ...List.generate(
            levelDay.tasks.length,
            (index) => TaskTile(
              task: levelDay.tasks[index],
              isBefore: levelDay.isBeforeTask(),
            ),
          ),
          levelDay.isBeforeDay()
              ? const SizedBox.shrink()
              : EmptyTaskTile(
                  levelDate: levelDay.dateDay,
                ),
        ],
      ),
    );
  }
}
