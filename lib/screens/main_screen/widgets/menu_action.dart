import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuAction extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;
  const MenuAction({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Row(
          children: [
            SizedBox(
              height: 13,
              width: 13,
              child: SvgPicture.asset(icon),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: const TextStyle(),
            ),
          ],
        ),
      ),
    );
  }
}
