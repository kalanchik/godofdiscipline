import 'package:godofdiscipline/models/statistics/statistics.dart';

class LevelService {
  LevelService._();

  static String getLevelName(LevelsNames level) {
    final levelsNames = <int, String>{
      1: 'Легко',
      2: 'Я могу',
      3: 'Я могу больше',
      4: 'Я крутой',
    };
    final levelName = levelsNames[level.index + 1];
    if (levelName == null) return 'Легко';
    return levelName;
  }
}
