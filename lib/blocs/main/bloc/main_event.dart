part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

final class LoadDataEvent extends MainEvent {
  LoadDataEvent({
    required this.onFail,
    required this.showDialog,
    required this.levelComplete,
  });

  final void Function(String error) onFail;
  final void Function(bool isComplete) showDialog;
  final void Function() levelComplete;
}

final class ChangeStatusEvent extends MainEvent {
  ChangeStatusEvent({
    required this.changeStatus,
    required this.checkDay,
    required this.showMessage,
  });

  final bool Function() changeStatus;
  final void Function() checkDay;
  final void Function(bool isError, String message) showMessage;
}
