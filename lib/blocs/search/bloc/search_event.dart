part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

final class SearchTasksEvent extends SearchEvent {
  SearchTasksEvent({required this.searchText});

  final String searchText;
}

final class ClearHistoryEvent extends SearchEvent {}

final class DeleteRequestEvent extends SearchEvent {
  final int index;

  DeleteRequestEvent({
    required this.index,
  });
}
