import 'package:godofdiscipline/models/levelday/levelday.dart';
import 'package:godofdiscipline/models/task/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'level.g.dart';

@JsonSerializable()
class Level {
  Level({
    required this.daysLevel,
    required this.startDate,
    required this.curLevel,
    required this.endDate,
    required this.levelLenght,
    required this.dayTaskCompleteCount,
  });

  // Текущий уровень
  AppLevels curLevel;
  // Дни пользователя
  final List<LevelDay> daysLevel;
  // Дата старта (1 уровень)
  DateTime startDate;
  // Дата завершения текущего уровня
  DateTime endDate;
  // Длина текущего уровня в неделях
  int levelLenght;
  // Сколько заданий нужно выполнять в день
  int dayTaskCompleteCount;

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelToJson(this);

  static Level getStarterLevel() {
    final curDate = DateTime.now();
    final startDate = curDate.add(const Duration(days: 1));
    final endDate = curDate.add(const Duration(days: 14));
    return Level(
      daysLevel: [
        LevelDay(
          dateDay: startDate,
          tasks: [],
          taskForComplete: 1,
          dayStatus: DayStatus.wait,
        ),
      ],
      startDate: startDate,
      curLevel: AppLevels.level1,
      endDate: endDate,
      levelLenght: 7,
      dayTaskCompleteCount: 1,
    );
  }

  LevelDay createLevelDay(DateTime dayDate) {
    return LevelDay(
      dateDay: dayDate,
      tasks: [],
      taskForComplete: dayTaskCompleteCount,
      dayStatus: DayStatus.wait,
    );
  }

  int? findDay(DateTime findDate) {
    for (var index = 0; index < daysLevel.length; index++) {
      final day = daysLevel[index];
      if (findDate == day.getDayDate()) {
        return index;
      }
    }
    return null;
  }

  void addNewDayAndTask(DateTime dayDate, Task task) {
    daysLevel.add(
      LevelDay(
        dateDay: dayDate,
        tasks: [task],
        taskForComplete: dayTaskCompleteCount,
        dayStatus: DayStatus.wait,
      ),
    );
  }

  void addTask(int index, Task task) {
    daysLevel[index].addTask(task);
  }
}

enum AppLevels {
  level1,
  level2,
  level3,
  level4,
  level5,
  level6,
  level7,
  level8,
  level9,
  level10,
}
