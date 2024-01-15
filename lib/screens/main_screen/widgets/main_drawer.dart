import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/api/auth/auth.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/menu_tile.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/profile_info.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
  });

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  late final AppUser user;

  @override
  void initState() {
    user = GetIt.I.get<AppUser>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: Color(0xFFEFF4F7),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 59,
          ),
          const ProfileInfo(),
          const SizedBox(
            height: 17,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 11,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBFDFC),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      MenuTile(
                        icon: 'profile',
                        body: 'Профиль',
                        onTap: () {
                          AutoRouter.of(context).push(const ProfileRoute());
                        },
                      ),
                      MenuTile(
                        icon: 'settings',
                        body: 'Настройки',
                        onTap: () {
                          AutoRouter.of(context).push(const SettingsRoute());
                        },
                      ),
                      MenuTile(
                        icon: 'category',
                        body: 'Все задания',
                        onTap: () {
                          AutoRouter.of(context).push(const AllTasksRoute());
                        },
                      ),
                      MenuTile(
                        icon: 'stat',
                        body: 'Статистика',
                        onTap: () {
                          AutoRouter.of(context).push(const StatRoute());
                        },
                      ),
                      MenuTile(
                        icon: 'rules',
                        body: 'Правила игры',
                        onTap: () {
                          AutoRouter.of(context).push(const RulesRoute());
                        },
                      ),
                      MenuTile(
                        icon: 'support',
                        body: 'Написать в поддержку',
                        onTap: () {
                          AutoRouter.of(context).push(const SupportRoute());
                        },
                      ),
                      MenuTile(
                        icon: 'blog',
                        body: 'Блог создателя',
                        onTap: () {},
                      ),
                      MenuTile(
                        icon: 'exit',
                        body: 'Выйти',
                        onTap: () async {
                          final auth = AuthService();
                          await auth.logOut();
                          AutoRouter.of(context).replace(const RegisterRoute());
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
