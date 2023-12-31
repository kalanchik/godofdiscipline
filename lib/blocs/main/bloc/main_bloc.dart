import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/api/user/user.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:meta/meta.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<LoadDataEvent>((event, emit) async {
      final service = UserService();
      final appUser = await service.getUserData();
      if (appUser == null) {
        event.onFail('Не удалось загрузить данные!');
        emit(FailureState());
        return;
      }
      GetIt.I.registerSingleton(appUser);
      emit(LoadDataState(user: appUser));
    });
  }
}
