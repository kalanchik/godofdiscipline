import 'package:bloc/bloc.dart';
import 'package:godofdiscipline/api/auth/auth.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginStartEvent>((event, emit) async {
      final auth = AuthService();
      final response = await auth.loginWithEmail(
        email: event.email,
        password: event.password,
      );
      if (response != true) {
        event.loginFail(response as String);
        return;
      }
      event.loginComplete();
    });
  }
}
