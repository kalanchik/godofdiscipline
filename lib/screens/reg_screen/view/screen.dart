import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godofdiscipline/blocs/auth/register/register_bloc.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/reg_body.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/reg_header.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_elevated_button.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_outline_button.dart';
import 'package:godofdiscipline/utils/feedback/feedback.dart';

@RoutePage()
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final RegisterBloc _bloc;

  late final TextEditingController firstNameCtrl;
  late final TextEditingController lastNameCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController passCtrl;
  late final TextEditingController passVerCtrl;

  final formKey = GlobalKey<FormState>();

  void _deleteControllers() {
    firstNameCtrl.dispose();
    lastNameCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
    passVerCtrl.dispose();
  }

  @override
  void dispose() {
    _deleteControllers();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _bloc = RegisterBloc();
    _bloc.add(CheckLogin(loginComplete: _regComplete));
    firstNameCtrl = TextEditingController();
    lastNameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    passVerCtrl = TextEditingController();
    passCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterBloc, RegisterState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is RegisterStartState) {
            return SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Регистрируем аккаунт',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const RegHeader(),
                  const SizedBox(
                    height: 37,
                  ),
                  RegBody(
                    firstNameCtrl: firstNameCtrl,
                    lastNameCtrl: lastNameCtrl,
                    emailCtrl: emailCtrl,
                    passCtrl: passCtrl,
                    passVerCtrl: passVerCtrl,
                    formKey: formKey,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TElevatedButton(
                          onTap: () {
                            _register();
                          },
                          text: 'Зарегистрироваться',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TOutlineButton(
                          onTap: () {
                            AutoRouter.of(context).push(const LoginRoute());
                          },
                          text: 'Войти',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 90,
                  ),
                  const Text(
                    'Есть проблемы? Напишите нам: support@godofdiscipline.ru',
                    style: TextStyle(
                      color: Color(0xFF00A7FF),
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _register() {
    if (!formKey.currentState!.validate()) {
      AppFeedback.showFeedback(
        context: context,
        isComplete: false,
        message: 'Заполните все поля!',
      );
      return;
    }
    if (passCtrl.text.trim() != passVerCtrl.text.trim()) {
      AppFeedback.showFeedback(
        context: context,
        isComplete: false,
        message: 'Пароли должны совпадать',
      );
      return;
    }
    _bloc.add(
      StartRegisterEvent(
        firstName: firstNameCtrl.text.trim(),
        lastName: lastNameCtrl.text.trim(),
        email: emailCtrl.text.trim(),
        pass: passCtrl.text.trim(),
        regFail: _regFail,
        regComplete: _regComplete,
      ),
    );
  }

  void _regFail(String error) {
    AppFeedback.showFeedback(
      context: context,
      isComplete: false,
      message: error,
    );
  }

  void _regComplete() {
    AutoRouter.of(context).replace(const MainRoute());
  }
}
