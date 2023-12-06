import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 146,
          width: 146,
          child: Stack(
            children: [
              Image.asset('assets/icons/def_avatar.png'),
              Positioned(
                bottom: 12,
                right: 10,
                child: SizedBox(
                  width: 21,
                  height: 21,
                  child: Image.asset(
                    'assets/icons/add_photo.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
