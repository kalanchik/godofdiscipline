import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/api/auth/auth.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:meta/meta.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<UpdateUserData>((event, emit) async {
      emit(UpdateDataState());
      await _updateUserData(
        firstName: event.firstName,
        lastName: event.lastName,
        birthday: event.birthday,
        email: event.email,
        showMessage: event.showMessage,
      );
      final checkPassword = _checkPassword(
        oldPass: event.oldPass,
        newPass: event.newPass,
        newVerPass: event.newVerpass,
        oldUserPass: event.oldUserPass,
        showMessage: event.showMessage,
      );
      if (!checkPassword) return;
      _updatePassword(event.newPass, event.showMessage);
    });
  }
}

Future<void> _updateUserData({
  required String firstName,
  required String lastName,
  required String birthday,
  required String email,
  required void Function(String message, bool isComplete) showMessage,
}) async {
  final data = _createDataForSend(
    firstName: firstName,
    lastName: lastName,
    birthday: birthday,
  );
  try {
    final response = await GetIt.I.get<AppUser>().updateUserData(data);
    if (!response) {
      showMessage('Данные обновить не удалось!', false);
    }
    showMessage('Данные успешно обновлены!', true);
  } catch (e) {
    showMessage('Данные обновить не удалось!', false);
  }
}

Map<String, dynamic> _createDataForSend({
  required String firstName,
  required String lastName,
  required String birthday,
}) {
  final dataForSend = <String, dynamic>{};
  if (firstName.isNotEmpty) {
    dataForSend.addAll({'firstName': firstName});
  }
  if (lastName.isNotEmpty) {
    dataForSend.addAll({'lastName': lastName});
  }
  if (birthday.isNotEmpty) {
    dataForSend
        .addAll({'birthday': _formatBirthday(birthday).toIso8601String()});
  }
  return dataForSend;
}

DateTime _formatBirthday(String birthday) {
  final dateSymbols = birthday.split('.');
  final dateNumbers = dateSymbols.map((e) => int.parse(e)).toList();
  return DateTime(dateNumbers[2], dateNumbers[1], dateNumbers[0]);
}

Future<void> _updatePassword(
  String newPassword,
  void Function(String message, bool isComplete) showMessage,
) async {
  final auth = AuthService();
  final response = await auth.changeUserPassword(newPassword);
  if (!response) {
    showMessage('Чтобы изменить пароль, перезайдите в аккаунт!', false);
    return;
  }
  GetIt.I.get<AppUser>().changePassword(newPassword);
  showMessage('Пароль успешно изменен!', true);
}

bool _checkPassword({
  required String oldPass,
  required String newPass,
  required String newVerPass,
  required String oldUserPass,
  required void Function(String message, bool isComplete) showMessage,
}) {
  if (oldPass.isEmpty & newPass.isEmpty & newVerPass.isEmpty) return false;
  if ((oldPass != oldUserPass) & newPass.isNotEmpty & newVerPass.isNotEmpty) {
    showMessage('Старый пароль не совпадает!', false);
    return false;
  }
  if ((oldUserPass != oldPass) & newPass.isEmpty & newVerPass.isEmpty) {
    showMessage('Заполните все поля, чтобы изменить пароль!', false);
    return false;
  }
  if ((oldUserPass == oldPass) & newPass.isNotEmpty & newVerPass.isNotEmpty) {
    if (newPass != newVerPass) {
      showMessage('Новый пароль не совпадает!', false);
      return false;
    }
  }
  if (oldPass == newPass) {
    showMessage('Старый и новый пароль не должны совпадать!', false);
    return false;
  }
  return true;
}
