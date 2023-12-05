import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_header.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/level_info.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {},
        backgroundColor: const Color(0xFF0194FE),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {},
          child: SizedBox(
            height: 10,
            width: 28,
            child: Image.asset(
              'assets/icons/menu.png',
            ),
          ),
        ),
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
