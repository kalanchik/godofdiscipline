import 'package:flutter/material.dart';
import 'package:godofdiscipline/models/levelday/levelday.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_action_button.dart';
import 'package:godofdiscipline/utils/validators/validators.dart';

class DayHeader extends StatefulWidget {
  const DayHeader({
    super.key,
    required this.dayDate,
    required this.needToAdd,
    required this.completeTasks,
    required this.remToDone,
    required this.levelDay,
  });

  final DateTime dayDate;
  final int needToAdd;
  final int completeTasks;
  final int remToDone;
  final LevelDay levelDay;

  @override
  State<DayHeader> createState() => _DayHeaderState();
}

class _DayHeaderState extends State<DayHeader> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              _buildDayText(widget.dayDate),
              const SizedBox(
                width: 18,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: SizedBox(
                  height: 13,
                  width: 13,
                  child: Image.asset('assets/icons/down_arrow.png'),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            curve: Curves.fastEaseInToSlowEaseOut,
            child: isOpen
                ? Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DayActionButton(
                            backgroundColor: const Color(0xFFB6DCF1),
                            textColor: const Color(0xFF108EE6),
                            text: 'Добавить:${widget.needToAdd}',
                          ),
                          DayActionButton(
                            backgroundColor: const Color(0xFF54D650),
                            textColor: Colors.white,
                            text: 'Выполнено:${widget.completeTasks}',
                          ),
                          DayActionButton(
                            backgroundColor: const Color(0xFFEA0001),
                            textColor: Colors.white,
                            text: 'Осталось:${widget.remToDone}',
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 21,
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          )
        ],
      ),
    );
  }

  Widget _buildDayText(DateTime dayDate) {
    final date = DateTime.now();
    final curDate = DateTime(date.year, date.month, date.day);
    final int tasksCount = widget.levelDay.calcDayTasks();
    if (dayDate.isBefore(curDate)) {
      if (tasksCount == 0) {
        return Text(
          '${_buildDayName(dayDate)}: Все выполнено',
          style: const TextStyle(
            color: Color(0xFF54D650),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        );
      }
      if (tasksCount > 0) {
        return Text(
          '${_buildDayName(dayDate)}: Не выполнено $tasksCount ${changeWordTask(tasksCount)}',
          style: const TextStyle(
            color: Color(0xFFEA0001),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        );
      }
    }
    if (dayDate == curDate) {
      if (widget.levelDay.isComplete) {
        return Text(
          '${_buildDayName(dayDate)}: Все выполнено',
          style: const TextStyle(
            color: Color(0xFF54D650),
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        );
      }
      if (tasksCount != 0) {
        return Flexible(
          child: Text(
            '${_buildDayName(dayDate)}: осталось выполнить $tasksCount ${changeWordTask(tasksCount)}',
            style: const TextStyle(
              color: Color(0xFFEA0001),
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
      if (tasksCount == 0) {
        return Flexible(
          child: Text(
            '${_buildDayName(dayDate)}: Вы добавили $tasksCount ${changeWordTask(tasksCount)}',
            style: const TextStyle(
              color: Color(0xFFEA0001),
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      }
      return Text(
        '${_buildDayName(dayDate)}: Все выполнено',
        style: const TextStyle(
          color: Color(0xFF54D650),
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      );
    }
    return Text(
      _buildDayName(dayDate),
      style: const TextStyle(
        color: Color(0xFF798994),
        fontSize: 17,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

String _buildDayName(DateTime dayDate) {
  final curDay = DateTime.now();
  final nextDay = curDay.add(const Duration(days: 1));
  final nextNextDay = curDay.add(const Duration(days: 2));
  final prevDay = curDay.add(const Duration(days: -1));
  if ((curDay.day == dayDate.day) &
      (curDay.month == dayDate.month) &
      (curDay.year == dayDate.year)) {
    return 'Сегодня';
  }
  if ((prevDay.day == dayDate.day) &
      (prevDay.month == dayDate.month) &
      (prevDay.year == dayDate.year)) {
    return 'Вчера';
  }
  if ((nextDay.day == dayDate.day) &
      (nextDay.month == dayDate.month) &
      (nextDay.year == dayDate.year)) {
    return 'Завтра';
  }
  if ((nextNextDay.day == dayDate.day) &
      (nextNextDay.month == dayDate.month) &
      (nextNextDay.year == dayDate.year)) {
    return 'Послезавтра';
  }
  return '${dayDate.day}.${dayDate.month}.${dayDate.year}';
}
