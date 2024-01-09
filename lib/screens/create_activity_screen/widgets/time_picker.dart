import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_elevated_button.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_outline_button.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({
    super.key,
    required this.updateTime,
  });

  final void Function(String date) updateTime;

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late final TextEditingController hourCtrl;
  late final TextEditingController minuteCtrl;

  bool showAlert = false;
  bool isComplete = false;
  String alertText = '';

  void _deleteControllers() {
    hourCtrl.dispose();
    minuteCtrl.dispose();
  }

  @override
  void dispose() {
    _deleteControllers();
    super.dispose();
  }

  @override
  void initState() {
    hourCtrl = TextEditingController();
    minuteCtrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 17,
            ),
            width: 300,
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                _buildHeader(context),
                const SizedBox(
                  height: 15,
                ),
                _buildBody(context),
                const SizedBox(
                  height: 15,
                ),
                showAlert ? _buildAlert() : const SizedBox.shrink(),
                Row(
                  children: [
                    TOutlineButton(
                      text: 'Отмена',
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    TElevatedButton(
                      text: 'Сохранить',
                      onTap: _saveTime,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildAlert() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              alertText,
              style: TextStyle(
                color: isComplete ? Colors.green : Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  showAlert = false;
                });
              },
              child: Icon(
                Icons.close,
                color: isComplete ? Colors.green : Colors.red,
                size: 20,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }

  void _saveTime() {
    try {
      final hour = int.parse(hourCtrl.text);
      final minute = int.parse(minuteCtrl.text);
      if ((minute < 0) | (minute > 60)) {
        setState(() {
          isComplete = false;
          showAlert = true;
          alertText = 'Неправильный формат времени!';
        });
        return;
      }
      if ((hour < 0) | (hour > 23)) {
        setState(() {
          isComplete = false;
          showAlert = true;
          alertText = 'Неправильный формат времени!';
        });
        return;
      }
      widget.updateTime('$hour:$minute');
      setState(() {
        isComplete = true;
        showAlert = true;
        alertText = 'Время обновлено!';
      });
    } catch (e) {
      setState(() {
        isComplete = false;
        showAlert = true;
        alertText = 'Неправильный формат времени!';
      });
    }
  }

  Row _buildBody(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: hourCtrl,
            cursorColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: minuteCtrl,
            keyboardType: TextInputType.number,
            cursorColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.center,
            textInputAction: TextInputAction.done,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Введите время',
          style: TextStyle(
            color: Color(0xFF071A2F),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(
              Icons.close,
              color: Color(0xFF798994),
            ),
          ),
        )
      ],
    );
  }
}
