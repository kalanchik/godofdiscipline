import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:godofdiscipline/screens/create_activity_screen/widgets/date_picker_dialog.dart';
import 'package:godofdiscipline/screens/create_activity_screen/widgets/time_picker.dart';

class DateTimeSelector extends StatelessWidget {
  const DateTimeSelector({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.updateDate,
    required this.updateTime,
  });

  final String selectedDate;
  final String selectedTime;
  final void Function(String date) updateDate;
  final void Function(String time) updateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 360,
          decoration: BoxDecoration(
            color: const Color(0xFFFBFDFC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    _showDateDialog(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 19,
                              width: 19,
                              child:
                                  SvgPicture.asset('assets/icons/calendar.svg'),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Выбрать дату',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Color(0xFF071A2F),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              selectedDate,
                              style: const TextStyle(
                                color: Color(0xFF071A2F),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
                              width: 11,
                              height: 11,
                              child: SvgPicture.asset(
                                'assets/icons/arrow_right.svg',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    _showTimeDialog(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 13,
                      vertical: 14,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              height: 19,
                              width: 19,
                              child: SvgPicture.asset('assets/icons/cloak.svg'),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const Text(
                              'Выбрать время',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                                color: Color(0xFF071A2F),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              selectedTime,
                              style: const TextStyle(
                                color: Color(0xFF071A2F),
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            SizedBox(
                              width: 11,
                              height: 11,
                              child: SvgPicture.asset(
                                'assets/icons/arrow_right.svg',
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => DatePicker(
        updateDate: updateDate,
      ),
    );
  }

  void _showTimeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => TimePicker(
        updateTime: updateTime,
      ),
    );
  }
}
