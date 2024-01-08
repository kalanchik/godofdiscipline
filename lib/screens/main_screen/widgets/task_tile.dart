import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/task_body.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/task_header.dart';

class TaskTile extends StatefulWidget {
  final String desc;
  final bool isComplete;
  const TaskTile({
    super.key,
    this.desc = '',
    this.isComplete = false,
  });

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              onPressed: (BuildContext context) {},
              icon: Icons.delete_outline_outlined,
              backgroundColor: const Color(0xFFEA0001),
              foregroundColor: Colors.white,
            ),
            SlidableAction(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              onPressed: (BuildContext context) {},
              icon: Icons.edit,
              backgroundColor: const Color(0xFFB6DCF1),
              foregroundColor: Colors.white,
            ),
          ],
        ),
        child: GestureDetector(
          onTap: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0),
            padding: const EdgeInsets.symmetric(
              horizontal: 13,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFBFDFC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                TaskHeader(
                  isComplete: widget.isComplete,
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 450),
                  curve: Curves.fastEaseInToSlowEaseOut,
                  child: isOpen ? const TaskBody() : const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
