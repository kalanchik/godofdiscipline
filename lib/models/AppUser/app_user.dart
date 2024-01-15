import 'package:godofdiscipline/api/user/user.dart';
import 'package:godofdiscipline/models/level/level.dart';
import 'package:godofdiscipline/models/levelday/levelday.dart';
import 'package:godofdiscipline/models/settings/settings.dart';
import 'package:godofdiscipline/models/statistics/statistics.dart';
import 'package:godofdiscipline/models/task/task.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser {
  final String email;
  String password;
  final String firstName;
  final String lastName;
  final DateTime birthday;
  final String avatar;
  final Level level;
  final String uid;
  final List<String> searchHistory;
  final DateTime regDate;
  final UserStatistics statistics;
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
    required this.birthday,
    required this.settings,
    required this.level,
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
      level: Level.getStarterLevel(),
      settings: AppSettings(),
      avatar: imageUrl,
    );
  }

  /// Менять старый пароль на переданный
  void changePassword(String newPassword) {
    password = newPassword;
  }

  /// Обновляет полные данные о пользователе
  Future<bool> updateUserData(Map<String, dynamic> data) async {
    final userService = UserService();
    final response = await userService.updateUserData(data);
    return response;
  }

  String getRegDate() {
    return '${regDate.day}.${regDate.month}.${regDate.year}';
  }

  bool _checkDay(DateTime date) {
    final findDay = level.days[date];
    if (findDay == null) return false;
    return true;
  }

  void _addNewTask(DateTime dayDate, Task task) {
    level.addNewDayAndTask(dayDate, task);
  }

  void addTask({
    required String selectedDate,
    required String selectedTime,
    required String title,
    required String desc,
  }) {
    final dateSymbols = selectedDate.split('.');
    final dateNumbers = dateSymbols.map((e) => int.parse(e)).toList();
    final taskDay = DateTime(dateNumbers[2], dateNumbers[1], dateNumbers[0]);
    final isCreateDay = _checkDay(taskDay);
    if (!isCreateDay) {
      _addNewTask(
        taskDay,
        Task(
          title: title,
          desc: desc,
          startTime: selectedTime,
          startDate: taskDay,
        ),
      );
      return;
    }
    level.days[taskDay]!.addTask(
      Task(
        title: title,
        desc: desc,
        startTime: selectedTime,
        startDate: taskDay,
      ),
    );
  }

  void createNextDay() {
    level.createNextDay();
  }

  List<LevelDay> getUserDays() {
    final sortedEntries = level.days.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    return sortedEntries.map((e) => e.value).toList();
  }

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
