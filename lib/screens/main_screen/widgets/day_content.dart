import 'package:flutter/material.dart';
import 'package:godofdiscipline/blocs/main/bloc/main_bloc.dart';
import 'package:godofdiscipline/models/levelday/levelday.dart';
import 'package:godofdiscipline/models/task/task.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_header.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/empty_task_tile.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/task_tile.dart';
import 'package:godofdiscipline/utils/feedback/feedback.dart';

class DayContent extends StatefulWidget {
  const DayContent({
    super.key,
    required this.levelDay,
    required this.bloc,
  });

  final LevelDay levelDay;
  final MainBloc bloc;

  @override
  State<DayContent> createState() => _DayContentState();
}

class _DayContentState extends State<DayContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          DayHeader(
            dayDate: widget.levelDay.dateDay,
            needToAdd: widget.levelDay.calcHowToAdd(),
            completeTasks: widget.levelDay.calcHowToComplete(),
            remToDone: widget.levelDay.calcHoToRemain(),
            levelDay: widget.levelDay,
          ),
          ...List.generate(
            widget.levelDay.tasks.length,
            (index) => TaskTile(
              task: widget.levelDay.tasks[index],
              isBefore: widget.levelDay.isBeforeTask(),
              checkDay: widget.levelDay.checkDayOnComplete,
              changeStatus: () {
                setState(() {
                  widget.bloc.add(
                    ChangeStatusEvent(
                      changeStatus: () {
                        final response =
                            widget.levelDay.tasks[index].changeStatus(
                          TaskStatus.complete,
                          _showTaskMessage,
                        );
                        return response;
                      },
                      checkDay: widget.levelDay.checkDayOnComplete,
                      showMessage: _showMessage,
                    ),
                  );
                });
              },
            ),
          ),
          widget.levelDay.isBeforeDay()
              ? const SizedBox.shrink()
              : EmptyTaskTile(
                  levelDate: widget.levelDay.dateDay,
                ),
        ],
      ),
    );
  }

  void _showTaskMessage(String message) {
    AppFeedback.showFeedback(
      context: context,
      isComplete: false,
      message: message,
    );
  }

  void _showMessage(bool isError, String message) {
    AppFeedback.showFeedback(
      context: context,
      isComplete: isError,
      message: message,
    );
  }
}
