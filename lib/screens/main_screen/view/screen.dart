import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_header.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/level_info.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/profile_info.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          AutoRouter.of(context).push(const CreateActivityRoute());
        },
        backgroundColor: const Color(0xFF0194FE),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: InkWell(
        //   onTap: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        //   child: SizedBox(
        //     height: 10,
        //     width: 28,
        //     child: Image.asset(
        //       'assets/icons/menu.png',
        //     ),
        //   ),
        // ),
        actions: [
          InkWell(
            onTap: () {
              AutoRouter.of(context).push(const SearchRoute());
            },
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/icons/search.png',
              ),
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          InkWell(
            onTap: () {},
            child: SizedBox(
              height: 30,
              width: 30,
              child: Image.asset(
                'assets/icons/more_horiz.png',
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
        ],
      ),
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 17,
              ),
              LevelInfo(),
              SizedBox(
                height: 28,
              ),
              DayHeader(),
            ],
          ),
        ),
      ),
    );
  }
}

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

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
                  child: const Column(
                    children: [
                      MenuTile(icon: 'profile', body: 'Профиль'),
                      MenuTile(icon: 'settings', body: 'Настройки'),
                      MenuTile(icon: 'category', body: 'Все задания'),
                      MenuTile(icon: 'stat', body: 'Статистика'),
                      MenuTile(icon: 'rules', body: 'Правила игры'),
                      MenuTile(icon: 'support', body: 'Написать в поддержку'),
                      MenuTile(icon: 'blog', body: 'Блог создателя'),
                      MenuTile(icon: 'exit', body: 'Выйти'),
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

class MenuTile extends StatelessWidget {
  final String icon;
  final String body;
  const MenuTile({
    super.key,
    required this.icon,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              SizedBox(
                height: 17,
                width: 17,
                child: Image.asset('assets/icons/$icon.png'),
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                body,
                style: const TextStyle(
                  color: Color(0xFF071A2F),
                  fontSize: 14,
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
