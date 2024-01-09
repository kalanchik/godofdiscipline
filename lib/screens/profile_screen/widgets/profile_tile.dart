import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.hint,
    required this.controller,
  });

  final String icon;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                fillColor: const Color(0xFFFBFDFC),
                filled: true,
                prefixIconConstraints: const BoxConstraints(
                  maxHeight: 20,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 11,
                    right: 20,
                  ),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: SvgPicture.asset(
                      'assets/icons/$icon.svg',
                    ),
                  ),
                ),
                hintText: hint,
                hintStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF798994),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
