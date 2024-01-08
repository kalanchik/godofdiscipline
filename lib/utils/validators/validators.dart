String? validateUsername(String value) {
  if (value.isEmpty) {
    return 'Заполните поле';
  }
  return null;
}
