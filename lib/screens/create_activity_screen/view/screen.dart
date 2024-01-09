import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/create_activity_screen/widgets/date_time_selector.dart';
import 'package:godofdiscipline/screens/create_activity_screen/widgets/task_conf.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_elevated_button.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_outline_button.dart';

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
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
