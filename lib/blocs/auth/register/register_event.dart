part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

final class StartRegisterEvent extends RegisterEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String pass;
  final void Function(String error) regFail;
  final void Function() regComplete;

  StartRegisterEvent({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.pass,
    required this.regFail,
    required this.regComplete,
  });
}

final class CheckLogin extends RegisterEvent {
  final void Function() loginComplete;

  CheckLogin({
    required this.loginComplete,
  });
}
