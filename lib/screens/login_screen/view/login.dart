import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godofdiscipline/blocs/auth/login/login_bloc.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/form_field.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/reg_header.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_elevated_button.dart';
import 'package:godofdiscipline/utils/feedback/feedback.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailCtrl;
  late final TextEditingController passCtrl;

  late final LoginBloc _bloc;

  final formKey = GlobalKey<FormState>();

  void _deleteControllers() {
    emailCtrl.dispose();
    passCtrl.dispose();
  }

  @override
  void dispose() {
    super.dispose();
    _deleteControllers();
  }

  @override
  void initState() {
    super.initState();
    emailCtrl = TextEditingController();
    passCtrl = TextEditingController();
    _bloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color(0xFF798994),
        ),
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
        bloc: _bloc,
        builder: (context, state) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const RegHeader(),
                  const SizedBox(
                    height: 100,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Вход',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TFormField(
                          hintText: 'Email',
                          action: TextInputAction.next,
                          controller: emailCtrl,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        TFormField(
                          hintText: 'Пароль',
                          isPassword: true,
                          action: TextInputAction.done,
                          controller: passCtrl,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: const Text(
                            'Забыли пароль?',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF071A2F),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        TElevatedButton(
                          text: 'Войти',
                          onTap: () {
                            _loginEvent();
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
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

  void _loginEvent() {
    if (!formKey.currentState!.validate()) {
      AppFeedback.showFeedback(
        context: context,
        isComplete: false,
        message: 'Заполните все поля',
      );
      return;
    }
    _bloc.add(
      LoginStartEvent(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
        loginComplete: _loginComplete,
        loginFail: _loginFail,
      ),
    );
  }

  void _loginFail(String error) {
    AppFeedback.showFeedback(
      context: context,
      isComplete: false,
      message: error,
    );
  }

  void _loginComplete() {
    AutoRouter.of(context).replaceAll(
      [
        const MainRoute(),
      ],
    );
  }
}
