import 'package:intl/intl.dart';

extension DateTimeExtensions on DateTime {
  // Format time in 24-hour format
  String formatTime24() {
    final timeFormat = DateFormat("HH:mm");
    return timeFormat.format(this);
  }

  // Format date in dd/MM/yyyy format
  String formatDate() {
    final dateFormat = DateFormat("dd/MM/yyyy");
    return dateFormat.format(this);
  }
}
