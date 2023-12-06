import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/change_password.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/delete_profile_button.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/password_header.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/profile_avatar.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/profile_info.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xFF798994),
        ),
        title: const Text(
          'Профиль',
          style: TextStyle(
            color: Color(0xFF071A2F),
            fontSize: 19,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileAvatar(),
            const SizedBox(
              height: 18,
            ),
            const ProfileInfo(),
            const SizedBox(
              height: 17,
            ),
            const PasswordHeader(),
            const SizedBox(
              height: 17,
            ),
            const ChangePassword(),
            const SizedBox(
              height: 14,
            ),
            const DeleteProfileButton(),
            const SizedBox(
              height: 44,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 1,
                            color: const Color(0xFF00A7FF),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Отмена',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color(0xFF108EE6),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: const Color(0xFF00A7FF),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Center(
                          child: Text(
                            'Найти',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 17,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
