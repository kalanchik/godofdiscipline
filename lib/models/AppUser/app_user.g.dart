// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppUser _$AppUserFromJson(Map<String, dynamic> json) => AppUser(
      email: json['email'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      uid: json['uid'] as String,
      avatar: json['avatar'] as String,
      searchHistory: (json['searchHistory'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      regDate: DateTime.parse(json['regDate'] as String),
      statistics:
          UserStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
      days: (json['days'] as List<dynamic>)
          .map((e) => Day.fromJson(e as Map<String, dynamic>))
          .toList(),
      birthday: DateTime.parse(json['birthday'] as String),
      settings: AppSettings.fromJson(json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AppUserToJson(AppUser instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'birthday': instance.birthday.toIso8601String(),
      'avatar': instance.avatar,
      'uid': instance.uid,
      'searchHistory': instance.searchHistory,
      'regDate': instance.regDate.toIso8601String(),
      'statistics': instance.statistics.toJson(),
      'days': instance.days.map((e) => e.toJson()).toList(),
      'settings': instance.settings.toJson(),
    };
