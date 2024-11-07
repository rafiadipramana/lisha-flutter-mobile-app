import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// Returns the day name using DateFormat
  String get dayName => DateFormat('EEEE').format(this);

  /// Returns the date in the format 'yyyy-MM-dd'
  String get toDateOnly => '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

  /// Returns the date in the format '8 Jul 2024'
  String get toDate => DateFormat('d MMM y').format(this);

  /// Returns the date in the format like this 'Thuesday,March 22,2024' using DateFormat
  String get toFullDate => DateFormat('EEEE, MMMM d, y').format(this);

  /// Returns the date in the format like this ''Marc 22, 2024'' using DateFormat
  String get toShortDate => DateFormat('MMMM d, y').format(this);

  /// Returns the time in the format 'HH:mm' from the example: 03:00:00+00
  String get toTime => DateFormat('HH:mm').format(this);
}