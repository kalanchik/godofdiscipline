part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class UpdateUserData extends ProfileEvent {
  UpdateUserData({
    required this.oldPass,
    required this.newPass,
    required this.newVerpass,
    required this.oldUserPass,
    required this.showMessage,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.email,
  });

  final String firstName;
  final String lastName;
  final String birthday;
  final String email;

  final String oldPass;
  final String newPass;
  final String newVerpass;
  final String oldUserPass;
  final void Function(String message, bool isComplete) showMessage;
}
