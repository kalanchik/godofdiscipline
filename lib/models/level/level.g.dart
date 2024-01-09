// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Level _$LevelFromJson(Map<String, dynamic> json) => Level(
      daysLevel: (json['daysLevel'] as List<dynamic>)
          .map((e) => LevelDay.fromJson(e as Map<String, dynamic>))
          .toList(),
      startDate: DateTime.parse(json['startDate'] as String),
      curLevel: $enumDecode(_$AppLevelsEnumMap, json['curLevel']),
      endDate: DateTime.parse(json['endDate'] as String),
      levelLenght: json['levelLenght'] as int,
      dayTaskCompleteCount: json['dayTaskCompleteCount'] as int,
    );

Map<String, dynamic> _$LevelToJson(Level instance) => <String, dynamic>{
      'curLevel': _$AppLevelsEnumMap[instance.curLevel]!,
      'daysLevel': instance.daysLevel.map((e) => e.toJson()).toList(),
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'levelLenght': instance.levelLenght,
      'dayTaskCompleteCount': instance.dayTaskCompleteCount,
    };

const _$AppLevelsEnumMap = {
  AppLevels.level1: 'level1',
  AppLevels.level2: 'level2',
  AppLevels.level3: 'level3',
  AppLevels.level4: 'level4',
  AppLevels.level5: 'level5',
  AppLevels.level6: 'level6',
  AppLevels.level7: 'level7',
  AppLevels.level8: 'level8',
  AppLevels.level9: 'level9',
  AppLevels.level10: 'level10',
};
