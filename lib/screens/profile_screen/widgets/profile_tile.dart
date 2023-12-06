import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String icon;
  final String hint;
  const ProfileTile({
    super.key,
    required this.icon,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 11),
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFFBFDFC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 20,
                  width: 20,
                  child: Image.asset('assets/icons/$icon.png'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF798994),
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
