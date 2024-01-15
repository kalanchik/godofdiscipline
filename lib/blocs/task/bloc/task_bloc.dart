import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/api/user/user.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:meta/meta.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<CreateTaskEvent>((event, emit) async {
      if (event.taskTitle.isEmpty) {
        event.showMessage(false, 'Название не можеть быть пустым');
        return;
      }
      // if (!_checkSelectedDate(event.selectedDate)) {
      //   event.showMessage(
      //     false,
      //     'Вы не можете добавить задание на прошедшую дату!',
      //   );
      //   return;
      // }
      final userService = UserService();
      final getIt = GetIt.I;
      getIt.get<AppUser>().addTask(
            selectedDate: event.selectedDate,
            selectedTime: event.selectedTime,
            title: event.taskTitle,
            desc: event.taskDesk,
          );
      final response = await userService.updateUserLevel(
        data: getIt.get<AppUser>().level.toJson(),
        uid: getIt.get<AppUser>().uid,
      );
      if (!response) {
        event.showMessage(false, 'Отправить задачу не удалось!');
        return;
      }
      event.showMessage(true, 'Задача успешно добавлена!');
    });
  }
}

bool _checkSelectedDate(String selectedDate) {
  final date = DateTime.now();
  final curDate = DateTime(date.year, date.month, date.day);
  final selectedSymbols = selectedDate.split('.');
  final selectedNumbers = selectedSymbols.map((e) => int.parse(e)).toList();
  final selDate = DateTime(
    selectedNumbers[2],
    selectedNumbers[1],
    selectedNumbers[0],
  );
  return curDate.isBefore(selDate);
}
