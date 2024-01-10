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

  void changeStatus(TaskStatus status) {
    isComplete = status;
  }

  bool isCompleteTask() {
    return isComplete == TaskStatus.complete;
  }
}

enum TaskStatus {
  wait,
  complete,
  fail,
}
