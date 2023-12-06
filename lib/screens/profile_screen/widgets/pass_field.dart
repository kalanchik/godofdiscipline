import 'package:flutter/material.dart';

class PassField extends StatelessWidget {
  final String hint;
  const PassField({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFFBFDFC),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hint,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF798994),
                  ),
                ),
                SizedBox(
                  width: 21,
                  height: 21,
                  child: Image.asset('assets/icons/eye.png'),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
