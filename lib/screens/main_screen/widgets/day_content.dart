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
          ),
          ...List.generate(
            levelDay.tasks.length,
            (index) => TaskTile(
              task: levelDay.tasks[index],
            ),
          ),
          EmptyTaskTile(
            levelDate: levelDay.dateDay,
          ),
        ],
      ),
    );
  }
}
