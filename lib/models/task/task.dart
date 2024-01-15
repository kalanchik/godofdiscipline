import 'package:json_annotation/json_annotation.dart';

part 'task.g.dart';

@JsonSerializable()
class Task {
  final String title;
  final String desc;
  final String startTime;
  final DateTime startDate;
  TaskStatus isComplete;

  Task({
    required this.title,
    required this.desc,
    required this.startTime,
    required this.startDate,
    this.isComplete = TaskStatus.wait,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);

  DateTime get taskDateTime {
    final timeSymbols = startTime.split(':');
    final timeNumbers = timeSymbols.map((e) => int.parse(e)).toList();
    return DateTime(
      startDate.year,
      startDate.month,
      startDate.day,
      timeNumbers[0],
      timeNumbers[1],
    );
  }

  bool changeStatus(TaskStatus status, void Function(String message) failTask) {
    final curDateTime = DateTime.now();
    final leftSide = taskDateTime.add(const Duration(minutes: -2));
    final rightSide = taskDateTime.add(const Duration(minutes: 2));
    if (!curDateTime.isAfter(leftSide)) {
      failTask('Вы еще не можете выполнить это задание!');
      return false;
    }
    if (!curDateTime.isBefore(rightSide)) {
      failTask('Вы не успели выполнить задание!');
      return false;
    }
    isComplete = status;
    return true;
  }

  bool isCompleteTask() {
    return isComplete == TaskStatus.complete;
  }

  static Map<String, dynamic> taskToServer({
    required String title,
    required String desc,
    required String startTime,
    required DateTime startDate,
  }) {
    return Task(
      title: title,
      desc: desc,
      startTime: startTime,
      startDate: startDate,
    ).toJson();
  }
}

enum TaskStatus {
  wait,
  complete,
  fail,
}
