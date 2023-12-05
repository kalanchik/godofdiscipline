import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/reg_body.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/reg_header.dart';

@RoutePage()
class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const RegHeader(),
              const SizedBox(
                height: 37,
              ),
              const RegBody(),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 360,
                      height: 45,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00A7FF),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          'Зарегистрироваться',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      AutoRouter.of(context).pushAndPopUntil(
                        const MainRoute(),
                        predicate: (_) => false,
                      );
                    },
                    child: Container(
                      width: 360,
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
                          'Войти',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                            color: Color(0xFF108EE6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 140,
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
      ),
    );
  }
}
