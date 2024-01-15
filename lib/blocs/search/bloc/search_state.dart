part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchCompleteState extends SearchState {
  final List<Task> findTasks;

  SearchCompleteState({required this.findTasks});
}
