import 'package:godofdiscipline/models/levelday/levelday.dart';
import 'package:godofdiscipline/models/task/task.dart';
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
    required this.days,
  });

  /// Текущий уровень
  AppLevels curLevel;

  /// Дни пользователя
  final List<LevelDay> daysLevel;

  /// Дни пользователя
  final Map<DateTime, LevelDay> days;

  /// Дата старта уровня
  DateTime startDate;

  ///  Дата завершения текущего уровня
  DateTime endDate;

  /// Длина текущего уровня в днях
  int levelLenght;

  /// Сколько заданий нужно выполнять в день
  int dayTaskCompleteCount;

  /// Возвращает название уровня
  String get levelName {
    final levelsNames = <int, String>{
      1: 'Легко',
      2: 'Я могу',
      3: 'Я могу больше',
      4: 'Я крутой',
    };
    final levelName = levelsNames[curLevel.index + 1];
    if (levelName == null) return 'Легко';
    return levelName;
  }

  /// Возвращает кол-во выполненных задний в текущий день
  int get completeDailyTask {
    final date = DateTime.now();
    final curDay = DateTime(date.year, date.month, date.day);
    final selectedDay = findDay(curDay);
    if (selectedDay == null) return 0;
    return selectedDay.tasksComplete;
  }

  /// Возращает кол-во заданий добавленный на завтрашний день
  int get addTomorrowTasks {
    final date = DateTime.now();
    final curDay = DateTime(date.year, date.month, date.day);
    final nextDay = curDay.add(const Duration(days: 1));
    final selectedDay = findDay(nextDay);
    if (selectedDay == null) return 0;
    return selectedDay.tasksAdd;
  }

  /// Возращает кол-во оставшихся дней в периоде
  String get dayPeriodLeft {
    final date = DateTime.now();
    final curDay = DateTime(date.year, date.month, date.day);
    final nextYear = DateTime(date.year + 1, 1, 1);
    final difference = nextYear.difference(curDay);
    return '${difference.inDays}';
  }

  /// Возвращает индекс уровня
  int get levelIndex {
    return curLevel.index + 1;
  }

  /// Возращает кол-во оставшихся дней для прохождения уровня
  int get leftDay {
    final day = DateTime(startDate.year, startDate.month, startDate.day);
    int daysCount = 0;
    for (var i = 0; i < levelLenght; i++) {
      final selectedDay = findDay(day);
      if (selectedDay == null) continue;
      if (selectedDay.isComplete) continue;
      daysCount += 1;
      day.add(Duration(days: i + 1));
    }
    return daysCount;
  }

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);

  Map<String, dynamic> toJson() => _$LevelToJson(this);

  /// Создает стартовый класс Level для регистрации
  static Level getStarterLevel() {
    final date = DateTime.now();
    final curDate = DateTime(date.year, date.month, date.day);
    final startDate = curDate.add(const Duration(days: 1));
    final endDate = curDate.add(const Duration(days: 14));
    return Level(
      daysLevel: [
        LevelDay(
          dateDay: startDate,
          tasks: [],
          taskForComplete: 1,
          dayStatus: DayStatus.wait,
        ),
      ],
      startDate: startDate,
      curLevel: AppLevels.level1,
      endDate: endDate,
      levelLenght: 14,
      dayTaskCompleteCount: 1,
      days: {
        startDate: LevelDay(
          dateDay: startDate,
          tasks: [],
          taskForComplete: 1,
          dayStatus: DayStatus.wait,
        ),
      },
    );
  }

  /// Проверяет вчерашний день на то, выполнен ли он или нет, если день не выполнен, то DayStatus = Fail или Complete
  void checkPrevDay(void Function(bool isComplete) showDialog) {
    final date = DateTime.now();
    final curDay = DateTime(date.year, date.month, date.day);
    final prevDay = curDay.add(const Duration(days: -1));
    final selectedDay = findDay(prevDay);
    if (selectedDay == null) return;
    if (selectedDay.dayStatus != DayStatus.wait) return;
    final check = selectedDay.checkDay();
    if (check == 'провал') {
      showDialog(false);
      return;
    }
  }

  /// Создает день по дате
  LevelDay createLevelDay(DateTime dayDate) {
    return LevelDay(
      dateDay: dayDate,
      tasks: [],
      taskForComplete: dayTaskCompleteCount,
      dayStatus: DayStatus.wait,
    );
  }

  /// Ищет день по дате, если дня нет null
  LevelDay? findDay(DateTime findDate) {
    final findDay = days[findDate];
    if (findDay == null) return null;
    return findDay;
  }

  /// Создает следующий день при входе в приложении
  void createNextDay() {
    final date = DateTime.now();
    final curDate = DateTime(date.year, date.month, date.day);
    final nextDay = curDate.add(const Duration(days: 1));
    final check = findDay(nextDay);
    if (check != null) return;
    days[nextDay] = createLevelDay(nextDay);
  }

  /// Сбросить прогресс текущего уровня
  void levelRollback() {
    final date = DateTime.now();
    final curDate = DateTime(date.year, date.month, date.day);
    final startDay = curDate.add(const Duration(days: 1));
    final endDay = curDate.add(Duration(days: levelLenght));
    startDate = startDay;
    endDate = endDay;
  }

  /// Добавить задчу + день, которого до этого не было
  void addNewDayAndTask(DateTime dayDate, Task task) {
    days[dayDate] = LevelDay(
      dateDay: dayDate,
      tasks: [task],
      taskForComplete: dayTaskCompleteCount,
      dayStatus: DayStatus.wait,
    );
  }

  /// Добавить новую задачу
  void addTask(DateTime dayDate, Task task) {
    final day = days[dayDate];
    if (day == null) return;
    // Сделать сортировку задач
    days[dayDate]!.addTask(task);
  }

  /// Проверяет выполнен ли уровень или нет, проверяется при входе в приложение
  void checkLevelComplete(void Function() levelComplete) {
    int completeDaysCount = 0;
    final selectedDay = startDate;
    for (var i = 0; i < levelLenght; i++) {
      final day = days[selectedDay];
      if (day == null) return;
      if (!day.isComplete) return;
      completeDaysCount += 1;
      selectedDay.add(Duration(days: i + 1));
    }
    if (completeDaysCount != levelLenght) return;
    levelComplete();
    _nextLevel();
  }

  /// Переход на следующий уровень
  void _nextLevel() {
    final curLevelIndex = curLevel.index;
    if (curLevelIndex == 9) return;
    curLevel = AppLevels.values[curLevelIndex + 1];
    levelLenght += 7;
    dayTaskCompleteCount += 1;
    final date = DateTime.now();
    final curdDay = DateTime(date.year, date.month, date.day);
    final startDay = curdDay.add(const Duration(days: 1));
    final endDay = startDay.add(Duration(days: levelLenght));
    startDate = startDay;
    endDate = endDay;
  }
}

/// Уровни которые есть в приложеие
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
