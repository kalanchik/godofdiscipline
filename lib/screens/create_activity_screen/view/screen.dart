import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:godofdiscipline/models/AppUser/app_user.dart';
import 'package:godofdiscipline/router/router.dart';
import 'package:godofdiscipline/screens/create_activity_screen/widgets/date_time_selector.dart';
import 'package:godofdiscipline/screens/create_activity_screen/widgets/task_conf.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_elevated_button.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_outline_button.dart';
import 'package:godofdiscipline/utils/feedback/feedback.dart';

@RoutePage()
class CreateActivityScreen extends StatefulWidget {
  const CreateActivityScreen({super.key});

  @override
  State<CreateActivityScreen> createState() => _CreateActivityScreenState();
}

class _CreateActivityScreenState extends State<CreateActivityScreen> {
  late final TextEditingController titleCtrl;
  late final TextEditingController descCtrl;

  late String selectedDate;
  late String selectedTime;

  void _deleteControllers() {
    titleCtrl.dispose();
    descCtrl.dispose();
  }

  @override
  void dispose() {
    _deleteControllers();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    titleCtrl = TextEditingController();
    descCtrl = TextEditingController();
    final nowDate = DateTime.now();
    final nowTime = TimeOfDay.now();
    selectedDate = '${nowDate.day}.${nowDate.month}.${nowDate.year}';
    selectedTime = '${nowTime.hour}:${nowTime.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AutoRouter.of(context).replace(const MainRoute());
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF798994),
        ),
        backgroundColor: Colors.transparent,
        title: const Text(
          'Создать новое задание',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w700,
            color: Color(0xFF071A2F),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TaskConf(
              titleCtrl: titleCtrl,
              descCtrl: descCtrl,
            ),
            const SizedBox(
              height: 9,
            ),
            DateTimeSelector(
              selectedDate: selectedDate,
              selectedTime: selectedTime,
              updateDate: _updateDate,
              updateTime: _updateTime,
            ),
            const SizedBox(
              height: 186,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  TOutlineButton(
                    text: 'Отмена',
                    onTap: () {},
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  TElevatedButton(
                    text: 'Создать',
                    onTap: _createTask,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createTask() {
    final checkTitle = _checkTitle();
    if (!checkTitle) {
      AppFeedback.showFeedback(
        context: context,
        isComplete: false,
        message: 'Название не может быть пустым!',
      );
      return;
    }
    final checkDate = _checkSelectedDate();
    if (!checkDate) {
      AppFeedback.showFeedback(
        context: context,
        isComplete: false,
        message: 'Вы не можете добавить задание на прошедшую дату!',
      );
      return;
    }
    GetIt.I.get<AppUser>().addTask(
          selectedDate: selectedDate,
          selectedTime: selectedTime,
          title: titleCtrl.text.trim(),
          desc: descCtrl.text.trim(),
        );
  }

  bool _checkTitle() {
    return titleCtrl.text.isNotEmpty;
  }

  bool _checkSelectedDate() {
    final date = DateTime.now();
    final curDate = DateTime(date.year, date.month, date.day);
    final selectedSymbols = selectedDate.split('.');
    final selectedNumbers = selectedSymbols.map((e) => int.parse(e)).toList();
    final selDate = DateTime(
      selectedNumbers[2],
      selectedNumbers[1],
      selectedNumbers[0],
    );
    return curDate.isBefore(selDate);
  }

  void _updateDate(String date) {
    setState(() {
      selectedDate = date;
    });
  }

  void _updateTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }
}
