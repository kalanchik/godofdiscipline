import 'package:godofdiscipline/models/levelday/levelday.dart';
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

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$LevelToJson(this);
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
