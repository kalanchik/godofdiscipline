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

  /// Возращает true если день выполнен
  bool get isComplete {
    if (dayStatus != DayStatus.complete) return false;
    return true;
  }

  /// Возвращает сколько задач выполнено
  int get tasksComplete {
    int completeTasksCount = 0;
    for (var task in tasks) {
      if (task.isComplete == TaskStatus.complete) {
        completeTasksCount += 1;
      }
    }
    return completeTasksCount;
  }

  /// Сколько всего задач на день добавлено
  int get tasksAdd {
    return tasks.length;
  }

  factory LevelDay.fromJson(Map<String, dynamic> json) =>
      _$LevelDayFromJson(json);

  Map<String, dynamic> toJson() => _$LevelDayToJson(this);

  /// Добавляет задачу
  void addTask(Task task) {
    tasks.add(task);
  }

  /// Возвращает DateTime в формате yyyy.mm.dd
  DateTime getDayDate() {
    return DateTime(dateDay.year, dateDay.month, dateDay.day);
  }

  /// Возращает кол-во задач, которое нужно добавить на день, чтобы закрыть норму
  int calcHowToAdd() {
    final tasksCount = tasks.length;
    int countToAdd = taskForComplete - tasksCount;
    if (countToAdd < 0) {
      return 0;
    }
    return countToAdd;
  }

  /// Проверяет на то выполнен ли день или нет
  void checkDayOnComplete() {
    if (tasksComplete >= taskForComplete) {
      dayStatus = DayStatus.complete;
    }
  }

  ///
  int calcHowToComplete() {
    int completeTaskCount = 0;
    for (var element in tasks) {
      if (element.isCompleteTask()) {
        completeTaskCount += 1;
      }
    }
    return completeTaskCount;
  }

  /// Возвращает кол-во задач, которое осталось выполнить
  int calcHoToRemain() {
    int waitTaskCount = 0;
    for (var element in tasks) {
      if (element.isComplete == TaskStatus.wait) {
        waitTaskCount += 1;
      }
    }
    return waitTaskCount;
  }

  /// Возращает кол-во задач, которые находятся на ожидании
  int calcDayTasks() {
    int tasksCount = 0;
    for (var task in tasks) {
      if (task.isComplete == TaskStatus.wait) {
        tasksCount += 1;
      }
    }
    return tasksCount;
  }

  /// Проверяет на то, идет ли этот день до текущего или нет
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

  /// Проверяет день на то, выполнено ли условие на день
  String checkDay() {
    int completeTasksCount = 0;
    for (var task in tasks) {
      if (task.isComplete == TaskStatus.complete) {
        completeTasksCount += 1;
      }
    }
    if (taskForComplete > completeTasksCount) {
      dayStatus = DayStatus.fail;
      return 'провал';
    }
    dayStatus = DayStatus.complete;
    return 'выполнен';
  }
}

/// Возможные статусы дня [wait, complete, fail]
enum DayStatus {
  wait,
  complete,
  fail,
}
