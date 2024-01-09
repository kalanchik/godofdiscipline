import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/blocs/profile/bloc/profile_bloc.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/change_password.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/delete_profile_button.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/password_header.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/profile_avatar.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/profile_info.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_elevated_button.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_outline_button.dart';
import 'package:godofdiscipline/utils/feedback/feedback.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late final TextEditingController firstNameCtrl;
  late final TextEditingController lastNameCtrl;
  late final TextEditingController birthdayCtrl;
  late final TextEditingController emailCtrl;

  late final TextEditingController oldPassCtrl;
  late final TextEditingController newPassCtrl;
  late final TextEditingController newPassVerCtrl;

  late final ProfileBloc _bloc;

  late final String oldPass;

  void _deleteControllers() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    birthdayCtrl.dispose();
    emailCtrl.dispose();
    oldPassCtrl.dispose();
    newPassCtrl.dispose();
    newPassVerCtrl.dispose();
  }

  @override
  void dispose() {
    _deleteControllers();
    super.dispose();
  }

  @override
  void initState() {
    oldPass = GetIt.I.get<AppUser>().password;
    firstNameCtrl = TextEditingController();
    lastNameCtrl = TextEditingController();
    birthdayCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    oldPassCtrl = TextEditingController();
    newPassCtrl = TextEditingController();
    newPassVerCtrl = TextEditingController();
    _bloc = ProfileBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
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
      body: BlocBuilder<ProfileBloc, ProfileState>(
        bloc: _bloc,
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const ProfileAvatar(),
                const SizedBox(
                  height: 18,
                ),
                ProfileInfo(
                  firstNameCtrl: firstNameCtrl,
                  lastNameCtrl: lastNameCtrl,
                  birthdayCtrl: birthdayCtrl,
                  emailCtrl: emailCtrl,
                ),
                const SizedBox(
                  height: 17,
                ),
                const PasswordHeader(),
                const SizedBox(
                  height: 17,
                ),
                ChangePassword(
                  oldPassCtrl: oldPassCtrl,
                  newPassCtrl: newPassCtrl,
                  newPassVerCtrl: newPassVerCtrl,
                ),
                const SizedBox(
                  height: 5,
                ),
                const DeleteProfileButton(),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      TOutlineButton(
                        text: 'Отмена',
                        onTap: () {
                          AutoRouter.of(context).pop();
                        },
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      TElevatedButton(
                        text: 'Сохранить',
                        onTap: () {
                          _bloc.add(
                            UpdateUserData(
                                firstName: firstNameCtrl.text.trim(),
                                lastName: lastNameCtrl.text.trim(),
                                birthday: birthdayCtrl.text.trim(),
                                email: emailCtrl.text.trim(),
                                oldPass: oldPassCtrl.text.trim(),
                                newPass: newPassCtrl.text.trim(),
                                newVerpass: newPassVerCtrl.text.trim(),
                                oldUserPass: oldPass,
                                showMessage: (String message, bool isComplete) {
                                  AppFeedback.showFeedback(
                                    context: context,
                                    isComplete: isComplete,
                                    message: message,
                                  );
                                }),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
