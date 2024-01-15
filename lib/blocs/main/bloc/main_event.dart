part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

final class LoadDataEvent extends MainEvent {
  final void Function(String error) onFail;
  final void Function(bool isComplete) showDialog;
  final void Function() levelComplete;

  LoadDataEvent({
    required this.onFail,
    required this.showDialog,
    required this.levelComplete,
  });
}
