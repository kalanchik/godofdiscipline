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
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 172,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFFFBFDFC),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Image.asset(
                              'assets/icons/avatar.png',
                            ),
                          ),
                          const SizedBox(
                            width: 13,
                          ),
                          const Text(
                            'Иванов Иван',
                            style: TextStyle(
                              color: Color(0xFF071A2F),
                              fontSize: 19,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
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
