import 'package:godofdiscipline/models/day/day.dart';
import 'package:godofdiscipline/models/settings/settings.dart';
import 'package:godofdiscipline/models/statistics/statistics.dart';

part 'app_user.g.dart';

class AppUser {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final String avatar;
  final String uid;
  final List<String> searchHistory;
  final DateTime regDate;
  final UserStatistics statistics;
  final List<Day> days;
  final AppSettings settings;

  AppUser({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.uid,
    required this.avatar,
    required this.searchHistory,
    required this.regDate,
    required this.statistics,
    required this.days,
    required this.birthday,
    required this.settings,
  });

  static AppUser getRegUser({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String uid,
    required String imageUrl,
  }) {
    return AppUser(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
      birthday: DateTime.now(),
      uid: uid,
      searchHistory: [],
      regDate: DateTime.now(),
      statistics: UserStatistics.getStartStat(
        gameStartDate: DateTime.now(),
      ),
      days: Day.setRegDay(startDate: DateTime.now()),
      settings: AppSettings(),
      avatar: imageUrl,
    );
  }

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
