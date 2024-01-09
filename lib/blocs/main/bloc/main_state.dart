part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}

final class LoadDataState extends MainState {
  final AppUser user;

  LoadDataState({required this.user});
}

final class FailureState extends MainState {}
