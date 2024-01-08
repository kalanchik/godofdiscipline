import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_header.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/empty_task_tile.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/filter_button.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/level_info.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/main_drawer.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/task_tile.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isOpen = false;
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
          const FilterButton(),
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
              TaskTile(),
              SizedBox(
                height: 15,
              ),
              TaskTile(
                isComplete: true,
              ),
              SizedBox(
                height: 15,
              ),
              EmptyTaskTile(),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
