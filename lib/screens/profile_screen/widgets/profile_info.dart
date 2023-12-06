import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/profile_screen/widgets/profile_tile.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          ProfileTile(icon: 'bio', hint: 'Имя'),
          SizedBox(
            height: 8,
          ),
          ProfileTile(icon: 'bio', hint: 'Фамилия'),
          SizedBox(
            height: 8,
          ),
          ProfileTile(icon: 'date', hint: 'Дата рождения'),
          SizedBox(
            height: 8,
          ),
          ProfileTile(icon: 'mail', hint: 'E-mail'),
        ],
      ),
    );
  }
}
