import 'package:flutter/material.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_elevated_button.dart';
import 'package:godofdiscipline/screens/reg_screen/widgets/t_outline_button.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({
    super.key,
    required this.updateDate,
  });

  final void Function(String date) updateDate;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late final TextEditingController dayCtrl;
  late final TextEditingController monthCtrl;
  late final TextEditingController yearCtrl;

  bool showAlert = false;
  bool isComplete = false;
  String alertText = '';

  void _deleteControllers() {
    dayCtrl.dispose();
    monthCtrl.dispose();
    yearCtrl.dispose();
  }

  @override
  void dispose() {
    _deleteControllers();
    super.dispose();
  }

  @override
  void initState() {
    dayCtrl = TextEditingController();
    monthCtrl = TextEditingController();
    yearCtrl = TextEditingController();
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
                      onTap: _saveDate,
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

  void _saveDate() {
    try {
      final checkDate = DateTime(
        int.parse(yearCtrl.text),
        int.parse(monthCtrl.text),
        int.parse(dayCtrl.text),
      );
      widget.updateDate(
        '${dayCtrl.text.trim()}.${monthCtrl.text.trim()}.${yearCtrl.text.trim()}',
      );
      setState(() {
        isComplete = true;
        showAlert = true;
        alertText = 'Дата обновлена!';
      });
    } catch (e) {
      setState(() {
        isComplete = false;
        showAlert = true;
        alertText = 'Неправильный формат даты!';
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
            controller: dayCtrl,
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
            controller: monthCtrl,
            keyboardType: TextInputType.number,
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
            controller: yearCtrl,
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
          'Введите дату',
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
