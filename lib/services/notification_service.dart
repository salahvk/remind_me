import 'package:flutter/services.dart';

class NativeNotificationService {
  static const _channel = MethodChannel('com.example.taskbuddy/notifications');

  static Future<void> scheduleNotification(
      String title, String description, DateTime time) async {
    final timeMillis = time.millisecondsSinceEpoch;
    await _channel.invokeMethod('scheduleNotification', {
      'title': title,
      'description': description,
      'timeMillis': timeMillis,
    });
  }
}
