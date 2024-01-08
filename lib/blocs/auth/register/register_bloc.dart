import 'package:bloc/bloc.dart';
import 'package:godofdiscipline/api/auth/auth.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<StartRegisterEvent>((event, emit) async {
      emit(RegisterStartState());
      final auth = AuthService();
      final uid = await auth.registerUserWithEmail(
        email: event.email,
        pass: event.pass,
      );
      if (uid.isEmpty ||
          uid == 'email-already-in-use' ||
          uid == 'invalid-email' ||
          uid == 'operation-not-allowed' ||
          uid == 'weak-password') {
        emit(RegisterInitial());
        event.regFail(uid);
        return;
      }
      final user = AppUser.getRegUser(
        email: event.email,
        password: event.pass,
        firstName: event.firstName,
        lastName: event.lastName,
        uid: uid,
        imageUrl: '',
      );
      final response = await auth.registerUser(data: user.toJson());
      if (!response) {
        emit(RegisterInitial());
        event.regFail('Не удалось созлать аккаунт!');
        return;
      }
      event.regComplete();
    });
    on<CheckLogin>((event, emit) async {
      final auth = AuthService();
      final isLogin = auth.isLogin();
      if (isLogin) {
        event.loginComplete();
      }
    });
  }
}
