import 'package:flutter/material.dart';

class TaskConf extends StatefulWidget {
  const TaskConf({
    super.key,
    required this.titleCtrl,
    required this.descCtrl,
  });

  final TextEditingController titleCtrl;
  final TextEditingController descCtrl;

  @override
  State<TaskConf> createState() => _TaskConfState();
}

class _TaskConfState extends State<TaskConf> {
  bool showDesc = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(
                left: 14,
                right: 14,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: const Color(0xFFFBFDFC),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: widget.titleCtrl,
                          cursorColor: Theme.of(context).primaryColor,
                          maxLines: null,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Название задания',
                            hintStyle: TextStyle(
                              color: Color(0xFFD3D8DC),
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  showDesc
                      ? Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: widget.descCtrl,
                                cursorColor: Theme.of(context).primaryColor,
                                maxLines: null,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Описание задания',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFD3D8DC),
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                  const SizedBox(
                    height: 96,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(5),
                      onTap: () {
                        setState(() {
                          showDesc = !showDesc;
                        });
                      },
                      child: Row(
                        children: [
                          Text(
                            showDesc
                                ? '- Убрать описание'
                                : '+ Добавить описание',
                            style: const TextStyle(
                              color: Color(0xFF00A7FF),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
