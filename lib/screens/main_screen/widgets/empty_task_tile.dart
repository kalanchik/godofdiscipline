import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godofdiscipline/router/router.dart';

class EmptyTaskTile extends StatelessWidget {
  const EmptyTaskTile({
    super.key,
    required this.levelDate,
  });

  final DateTime levelDate;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          AutoRouter.of(context).replace(const CreateActivityRoute());
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          padding: const EdgeInsets.symmetric(
            horizontal: 17,
            vertical: 18,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFBFDFC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 20,
                height: 20,
                child: SvgPicture.asset('assets/icons/add.svg'),
              ),
              const SizedBox(
                width: 22,
              ),
              const Text(
                'Новое задание',
                style: TextStyle(
                  color: Color(0xFFD3D8DC),
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
