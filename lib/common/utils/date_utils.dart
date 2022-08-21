class AppDateUtils {
  static String dateOnly(DateTime date) =>
      "${date.year}-${date.month}-${date.day}";

  static String timeOnly(DateTime date) =>
      "${_convertToTwoChars(date.hour)}:${_convertToTwoChars(date.minute)}";

  static String _convertToTwoChars(int value) {
    if (value < 10) {
      return "0$value";
    } else {
      return value.toString();
    }
  }
}
