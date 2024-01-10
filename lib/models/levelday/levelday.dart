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

  int calcHowToAdd() {
    final tasksCount = tasks.length;
    int countToAdd = taskForComplete - tasksCount;
    if (countToAdd < 0) {
      return 0;
    }
    return countToAdd;
  }

  int calcHowToComplete() {
    int completeTaskCount = 0;
    for (var element in tasks) {
      if (element.isCompleteTask()) {
        completeTaskCount += 1;
      }
    }
    return completeTaskCount;
  }

  int calcHoToRemain() {
    int waitTaskCount = 0;
    for (var element in tasks) {
      if (element.isComplete == TaskStatus.wait) {
        waitTaskCount += 1;
      }
    }
    return waitTaskCount;
  }

  int calcDayTasks() {
    int tasksCount = 0;
    for (var task in tasks) {
      if (task.isComplete == TaskStatus.wait) {
        tasksCount += 1;
      }
    }
    return tasksCount;
  }

  bool isBeforeDay() {
    final date = DateTime.now();
    final curDate = DateTime(date.year, date.month, date.day);
    if (dateDay == curDate) return true;
    return dateDay.isBefore(curDate);
  }

  bool isBeforeTask() {
    final date = DateTime.now();
    final curDate = DateTime(date.year, date.month, date.day);
    return dateDay.isBefore(curDate);
  }
}

enum DayStatus {
  wait,
  complete,
  fail,
}
