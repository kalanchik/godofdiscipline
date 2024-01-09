import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:godofdiscipline/blocs/main/bloc/main_bloc.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_header.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/empty_task_tile.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/filter_button.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/level_info.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/main_drawer.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/task_tile.dart';
import 'package:godofdiscipline/utils/feedback/feedback.dart';

@RoutePage()
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isOpen = false;
  late final MainBloc _bloc;
  @override
  void initState() {
    super.initState();
    _bloc = MainBloc();
    _bloc.add(LoadDataEvent(onFail: onFail));
  }

  void onFail(String error) {
    AppFeedback.showFeedback(
      context: context,
      isComplete: false,
      message: error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BlocBuilder<MainBloc, MainState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoadDataState) {
            return const MainDrawer();
          }
          return const SizedBox.shrink();
        },
      ),
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
      body: BlocBuilder<MainBloc, MainState>(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoadDataState) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 17,
                    ),
                    LevelInfo(
                      userLevel: state.user.statistics.curLevel,
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    const DayContent(),
                    const SizedBox(
                      height: 15,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            );
          }
          return Column(
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
              const Text('Загружаем задачи'),
            ],
          );
        },
      ),
    );
  }
}

class DayContent extends StatelessWidget {
  const DayContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
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
      ],
    );
  }
}
