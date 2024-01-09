import 'package:godofdiscipline/api/user/user.dart';
import 'package:godofdiscipline/models/level/level.dart';
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

  void changePassword(String newPassword) {
    password = newPassword;
  }

  Future<bool> updateUserData(Map<String, dynamic> data) async {
    final userService = UserService();
    final response = await userService.updateUserData(data);
    return response;
  }

  String getLevel() {
    final levelsNames = <int, String>{
      1: 'Легко',
      2: 'Я могу',
      3: 'Я могу больше',
      4: 'Я крутой',
    };
    final levelName = levelsNames[statistics.curLevel.index + 1];
    if (levelName == null) return 'Легко';
    return levelName;
  }

  String getRegDate() {
    return '${regDate.day}.${regDate.month}.${regDate.year}';
  }

  int getDailyCompleteTasks() {
    int completeTasks = 0;
    final curDate = DateTime.now();
    for (var element in []) {
      if ((element.dayDate.day == curDate.day) &
          (element.dayDate.month == curDate.month) &
          (element.dayDate.year == curDate.year)) {
        for (var task in element.tasks) {
          if (task.isComplete == TaskStatus.complete) {
            completeTasks += 1;
          }
        }
      }
    }
    return completeTasks;
  }

  bool _checkDay(DateTime date) {
    for (var levelDay in level.daysLevel) {
      final levelDate = DateTime(
        levelDay.dateDay.year,
        levelDay.dateDay.month,
        levelDay.dateDay.day,
      );
      if (levelDate == date) {
        return true;
      }
    }
    return false;
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
    final dayIndex = level.findDay(taskDay);
    level.addTask(
      dayIndex!,
      Task(
        title: title,
        desc: desc,
        startTime: selectedTime,
        startDate: taskDay,
      ),
    );
  }

  int getTommorowTasksCount() {
    int addTasks = 0;
    final curDate = DateTime.now();
    final nextDate = curDate.add(const Duration(days: 1));
    for (var element in []) {
      if ((element.dayDate.day == nextDate.day) &
          (element.dayDate.month == nextDate.month) &
          (element.dayDate.year == nextDate.year)) {
        for (var task in element.tasks) {
          if (task.isComplete == TaskStatus.wait) {
            addTasks += 1;
          }
        }
      }
    }
    return addTasks;
  }

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);

  Map<String, dynamic> toJson() => _$AppUserToJson(this);
}
