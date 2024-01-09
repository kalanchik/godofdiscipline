import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:godofdiscipline/screens/main_screen/widgets/info_tile.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  late final AppUser user;

  @override
  void initState() {
    user = GetIt.I.get<AppUser>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 172,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFFBFDFC),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 30,
                      width: 30,
                      child: SvgPicture.asset(
                        'assets/icons/avatar.svg',
                      ),
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      '${user.firstName} ${user.lastName}',
                      style: const TextStyle(
                        color: Color(0xFF071A2F),
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                InfoTile(
                  header: 'Текущий статус:',
                  body: user.getLevel(),
                ),
                const SizedBox(
                  height: 4,
                ),
                InfoTile(
                  header: 'Начало периода:',
                  body: 'c ${user.getRegDate()}',
                ),
                const SizedBox(
                  height: 4,
                ),
                const InfoTile(
                  header: 'Осталось в периоде:',
                  body: '300 дней',
                ),
                const SizedBox(
                  height: 4,
                ),
                InfoTile(
                  header: 'Сегодня выполнено:',
                  body: '${user.getDailyCompleteTasks()} заданий из 10',
                ),
                const SizedBox(
                  height: 4,
                ),
                InfoTile(
                  header: 'Завтра:',
                  body:
                      'добавлено ${user.getTommorowTasksCount()} задание из 10',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
