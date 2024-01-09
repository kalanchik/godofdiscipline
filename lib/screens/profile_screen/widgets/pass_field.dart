import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PassField extends StatefulWidget {
  const PassField({
    super.key,
    required this.hint,
    required this.controller,
  });

  final String hint;
  final TextEditingController controller;

  @override
  State<PassField> createState() => _PassFieldState();
}

class _PassFieldState extends State<PassField> {
  bool showPass = true;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 45,
            decoration: const BoxDecoration(),
            child: TextFormField(
              controller: widget.controller,
              obscureText: showPass,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                filled: true,
                hintText: widget.hint,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF798994),
                ),
                suffixIconConstraints: const BoxConstraints(
                  maxHeight: 21,
                ),
                suffixIcon: Material(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        setState(() {
                          showPass = !showPass;
                        });
                      },
                      child: SizedBox(
                        height: 21,
                        width: 21,
                        child: SvgPicture.asset(
                          'assets/icons/eye_closed.svg',
                        ),
                      ),
                    ),
                  ),
                ),
                fillColor: const Color(0xFFFBFDFC),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
