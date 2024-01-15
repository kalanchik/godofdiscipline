part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class LoadDataState extends MainState {
  final AppUser user;
  final List<LevelDay> days;

  LoadDataState({required this.user, required this.days});
}

final class FailureState extends MainState {}
