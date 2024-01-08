import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  final String icon;
  final String body;
  final VoidCallback onTap;
  const MenuTile({
    super.key,
    required this.icon,
    required this.body,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(),
          child: Row(
            children: [
              SizedBox(
                height: 17,
                width: 17,
                child: Image.asset('assets/icons/$icon.png'),
              ),
              const SizedBox(
                width: 9,
              ),
              Text(
                body,
                style: const TextStyle(
                  color: Color(0xFF071A2F),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
