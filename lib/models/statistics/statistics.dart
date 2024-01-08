import 'package:json_annotation/json_annotation.dart';

part 'statistics.g.dart';

@JsonSerializable()
class UserStatistics {
  final LevelsNames curLevel;
  final int daysTasksComplete;
  final int addTomorrowTasks;
  final int addAllTasks;
  final String gameTime;
  final DateTime gameStartDate;
  final int allAddTasks;
  final int allCompleteTasks;

  UserStatistics({
    required this.curLevel,
    required this.daysTasksComplete,
    required this.addTomorrowTasks,
    required this.addAllTasks,
    required this.gameTime,
    required this.gameStartDate,
    required this.allAddTasks,
    required this.allCompleteTasks,
  });

  static UserStatistics getStartStat({
    required DateTime gameStartDate,
  }) {
    return UserStatistics(
      curLevel: LevelsNames.level1,
      daysTasksComplete: 0,
      addTomorrowTasks: 0,
      addAllTasks: 0,
      gameTime: '1 день',
      gameStartDate: gameStartDate,
      allAddTasks: 0,
      allCompleteTasks: 0,
    );
  }

  factory UserStatistics.fromJson(Map<String, dynamic> json) =>
      _$UserStatisticsFromJson(json);

  Map<String, dynamic> toJson() => _$UserStatisticsToJson(this);
}

enum LevelsNames {
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
