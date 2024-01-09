// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'levelday.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LevelDay _$LevelDayFromJson(Map<String, dynamic> json) => LevelDay(
      dateDay: DateTime.parse(json['dateDay'] as String),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => Task.fromJson(e as Map<String, dynamic>))
          .toList(),
      taskForComplete: json['taskForComplete'] as int,
      dayStatus: $enumDecode(_$DayStatusEnumMap, json['dayStatus']),
    );

Map<String, dynamic> _$LevelDayToJson(LevelDay instance) => <String, dynamic>{
      'dateDay': instance.dateDay.toIso8601String(),
      'tasks': instance.tasks.map((e) => e.toJson()).toList(),
      'taskForComplete': instance.taskForComplete,
      'dayStatus': _$DayStatusEnumMap[instance.dayStatus]!,
    };

const _$DayStatusEnumMap = {
  DayStatus.wait: 'wait',
  DayStatus.complete: 'complete',
  DayStatus.fail: 'fail',
};
