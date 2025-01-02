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

 static Future<void> triggerNotification(String title, String description) async {
    try {
    final s =  await _channel.invokeMethod('triggerNotification', {
        'title': title,
        'description': description,
      });
      print(s);
    } on PlatformException catch (e) {
      print("Failed to trigger notification: '${e.message}'.");
    }
  }
}
