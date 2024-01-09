import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DeleteProfileButton extends StatelessWidget {
  const DeleteProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Row(
              children: [
                SizedBox(
                  height: 18,
                  width: 18,
                  child: SvgPicture.asset(
                    'assets/icons/trash.svg',
                    color: const Color(0xFFF69223),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Удалить профиль',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFF69223),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
