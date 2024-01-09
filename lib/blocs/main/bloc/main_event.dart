part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}

final class LoadDataEvent extends MainEvent {
  final void Function(String error) onFail;

  LoadDataEvent({required this.onFail});
}
