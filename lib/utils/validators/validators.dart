String? validateUsername(String value) {
  if (value.isEmpty) {
    return 'Заполните поле';
  }
  return null;
}

String changeWordTask(int number) {
  if (number % 10 == 1 && number % 100 != 11) {
    return 'задание';
  } else if ((number % 10 >= 2 && number % 10 <= 4) &&
      (number % 100 < 10 || number % 100 >= 20)) {
    return 'задания';
  } else {
    return 'заданий';
  }
}
