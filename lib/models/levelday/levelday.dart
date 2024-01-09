import 'package:godofdiscipline/models/task/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'levelday.g.dart';

@JsonSerializable()
class LevelDay {
  LevelDay({
    required this.dateDay,
    required this.tasks,
    required this.taskForComplete,
    required this.dayStatus,
  });
  // Дата дня
  final DateTime dateDay;
  // Задачи на этот день
  final List<Task> tasks;
  // Сколько нужно выполнить заданий, чтобы выполнить день
  int taskForComplete;
  // Статус дня
  DayStatus dayStatus;

  factory LevelDay.fromJson(Map<String, dynamic> json) =>
      _$LevelDayFromJson(json);

  Map<String, dynamic> toJson() => _$LevelDayToJson(this);

  void addTask(Task task) {
    tasks.add(task);
  }

  DateTime getDayDate() {
    return DateTime(dateDay.year, dateDay.month, dateDay.day);
  }
}

enum DayStatus {
  wait,
  complete,
  fail,
}
