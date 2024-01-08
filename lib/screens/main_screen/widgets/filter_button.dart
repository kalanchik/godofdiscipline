import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/menu_action.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MenuAnchor(
      style: MenuStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 16,
          ),
        ),
      ),
      builder: (context, menuController, widget) {
        return IconButton(
          onPressed: () {
            if (menuController.isOpen) {
              menuController.close();
            } else {
              menuController.open();
            }
          },
          icon: SizedBox(
            height: 30,
            width: 30,
            child: Image.asset('assets/icons/more_horiz.png'),
          ),
        );
      },
      menuChildren: [
        MenuAction(
          onTap: () {},
          text: 'Все задания сегодня',
          icon: 'assets/icons/list_task_1.svg',
        ),
        const SizedBox(
          height: 11,
        ),
        MenuAction(
          onTap: () {},
          text: 'Неотмеченные задания',
          icon: 'assets/icons/list_task_2.svg',
        ),
        const SizedBox(
          height: 11,
        ),
        MenuAction(
          onTap: () {},
          text: 'Неотмеченные задания',
          icon: 'assets/icons/list_task_3.svg',
        ),
        const SizedBox(
          height: 11,
        ),
        MenuAction(
          onTap: () {},
          text: 'Сбросить',
          icon: 'assets/icons/trash.svg',
        ),
      ],
    );
  }
}
