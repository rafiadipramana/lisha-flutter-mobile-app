import 'package:intl/intl.dart';

extension StringDateTimeExtension on String {
  /// Returns the string 03:00:00+00 to DateTime using DateFormat from intl
  DateTime get toDateTime => DateFormat('HH:mm:ssZ').parse(this);
}