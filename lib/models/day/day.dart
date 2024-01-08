import 'package:godofdiscipline/models/task/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day.g.dart';

@JsonSerializable()
class Day {
  final DateTime dayDate;
  final List<Task> tasks;

  Day({
    required this.dayDate,
    required this.tasks,
  });

  factory Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

  Map<String, dynamic> toJson() => _$DayToJson(this);

  static List<Day> setRegDay({
    required DateTime startDate,
  }) {
    return [
      Day(
        dayDate: startDate,
        tasks: [],
      )
    ];
  }
}
