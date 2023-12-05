import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onTap: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
