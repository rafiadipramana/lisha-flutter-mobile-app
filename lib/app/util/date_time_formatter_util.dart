class DateTimeFormatterUtil {
  /// function to convert date time to time with format HH:mm
  static String convertDateTimeStringToTime(String dateTimeString) {
    final dateTime = DateTime.parse(dateTimeString);
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  /// function to convert date time to date with format yyyy-MM-dd
  static String convertDateTimeToDate(DateTime dateTime) {
    return '${dateTime.year}-${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')}';
  }
}
