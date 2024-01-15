part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

final class CreateTaskEvent extends TaskEvent {
  CreateTaskEvent({
    required this.selectedDate,
    required this.selectedTime,
    required this.taskTitle,
    required this.taskDesk,
    required this.showMessage,
  });

  final String selectedDate;
  final String selectedTime;
  final String taskTitle;
  final String taskDesk;
  final void Function(bool isError, String message) showMessage;
}
