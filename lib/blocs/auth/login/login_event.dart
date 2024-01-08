part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

final class LoginStartEvent extends LoginEvent {
  final String email;
  final String password;
  final void Function() loginComplete;
  final void Function(String error) loginFail;

  LoginStartEvent({
    required this.email,
    required this.password,
    required this.loginComplete,
    required this.loginFail,
  });
}
