import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SerchField extends StatelessWidget {
  const SerchField({
    super.key,
    required this.controller,
    required this.clearSearch,
  });

  final TextEditingController controller;

  final VoidCallback clearSearch;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextFormField(
              controller: controller,
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 7,
                  vertical: 0,
                ),
                filled: true,
                prefixIconConstraints: const BoxConstraints(
                  maxHeight: 25,
                  minHeight: 10,
                ),
                hintText: 'Найти',
                hintStyle: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF798994),
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: SizedBox(
                    height: 25,
                    width: 25,
                    child: SvgPicture.asset('assets/icons/search.svg'),
                  ),
                ),
                fillColor: const Color(0xFFD3D8DC),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: clearSearch,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                'Отмена',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
