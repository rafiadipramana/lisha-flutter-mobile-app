class DateTimeFormatterUtil {
  /// function to convert date time to time with format HH:mm
  static String convertDateTimeStringToTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}
