import 'package:intl/intl.dart';

extension StringToDateTime on String {
  // Combine date and time strings into a DateTime object
  DateTime toDateTime(String time) {
    final inputFormat = DateFormat("dd/MM/yyyy HH:mm");
    return inputFormat.parse("$this $time");
  }
}
