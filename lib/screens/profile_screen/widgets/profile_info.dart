import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/profile_tile.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.firstNameCtrl,
    required this.lastNameCtrl,
    required this.birthdayCtrl,
    required this.emailCtrl,
  });

  final TextEditingController firstNameCtrl;
  final TextEditingController lastNameCtrl;
  final TextEditingController birthdayCtrl;
  final TextEditingController emailCtrl;

  @override
  Widget build(BuildContext context) {
    final user = GetIt.I.get<AppUser>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ProfileTile(
            icon: 'bio',
            hint: user.firstName,
            controller: firstNameCtrl,
          ),
          const SizedBox(
            height: 8,
          ),
          ProfileTile(
            icon: 'bio',
            hint: user.lastName,
            controller: lastNameCtrl,
          ),
          const SizedBox(
            height: 8,
          ),
          ProfileTile(
            icon: 'date',
            hint:
                '${user.birthday.day}.${user.birthday.month}.${user.birthday.year}',
            controller: birthdayCtrl,
          ),
          const SizedBox(
            height: 8,
          ),
          ProfileTile(
            icon: 'mail',
            hint: user.email,
            controller: emailCtrl,
          ),
        ],
      ),
    );
  }
}
