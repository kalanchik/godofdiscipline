// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      title: json['title'] as String,
      desc: json['desc'] as String,
      startTime: json['startTime'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      isComplete:
          $enumDecodeNullable(_$TaskStatusEnumMap, json['isComplete']) ??
              TaskStatus.wait,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'startTime': instance.startTime,
      'startDate': instance.startDate.toIso8601String(),
      'isComplete': _$TaskStatusEnumMap[instance.isComplete]!,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.wait: 'wait',
  TaskStatus.complete: 'complete',
  TaskStatus.fail: 'fail',
};
