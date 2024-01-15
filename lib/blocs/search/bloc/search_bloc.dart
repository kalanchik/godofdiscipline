import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/api/user/user.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:godofdiscipline/models/task/task.dart';
import 'package:meta/meta.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchTasksEvent>((event, emit) async {
      if (event.searchText.isEmpty) return;
      final findTasks = <Task>[];
      final user = GetIt.I.get<AppUser>();
      final userService = UserService();
      user.level.days.forEach((dayDate, day) {
        final containsTasks = day.tasks.where(
          (task) =>
              task.title.toLowerCase().contains(event.searchText.toLowerCase()),
        );
        findTasks.addAll(containsTasks);
      });
      user.searchHistory.add(event.searchText);
      final sortedSearchList = user.searchHistory.toSet().toList();
      user.searchHistory = sortedSearchList;
      await userService.updateSearchHistory(sortedSearchList, user.uid);
      emit(SearchCompleteState(findTasks: findTasks));
    });
    on<ClearHistoryEvent>((event, emit) async {
      final userService = UserService();
      GetIt.I.get<AppUser>().searchHistory.clear();
      final user = GetIt.I.get<AppUser>();
      await userService.updateSearchHistory(user.searchHistory, user.uid);
      emit(SearchInitial());
    });
    on<DeleteRequestEvent>((event, emit) async {
      GetIt.I.get<AppUser>().searchHistory.removeAt(event.index);
      final UserService userService = UserService();
      final user = GetIt.I.get<AppUser>();
      await userService.updateSearchHistory(user.searchHistory, user.uid);
      emit(SearchInitial());
    });
  }
}
