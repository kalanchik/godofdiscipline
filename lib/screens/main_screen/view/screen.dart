import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/blocs/main/bloc/main_bloc.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_content.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/day_dialog.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/filter_button.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/level_complete.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/level_info.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/main_drawer.dart';
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
    _bloc.add(
      LoadDataEvent(
        onFail: onFail,
        showDialog: _showDialog,
        levelComplete: _showLevelComplete,
      ),
    );
  }

  void _showLevelComplete() {
    showDialog(
      context: context,
      builder: (context) => const LevelComplete(),
    );
  }

  void onFail(String error) {
    AppFeedback.showFeedback(
      context: context,
      isComplete: false,
      message: error,
    );
  }

  void _showDialog(bool isComplete) {
    showDialog(
      context: context,
      builder: (context) => const DayDialog(),
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
          AutoRouter.of(context).replace(const CreateActivityRoute());
        },
        backgroundColor: const Color(0xFF0194FE),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  LevelInfo(
                    level: GetIt.I.get<AppUser>().level,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemCount: state.days.length,
                      itemBuilder: (context, index) {
                        return DayContent(levelDay: state.days[index]);
                      },
                    ),
                  ),
                ],
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
