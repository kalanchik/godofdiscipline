import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              SvgPicture.asset('assets/icons/def_avatar.svg'),
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
