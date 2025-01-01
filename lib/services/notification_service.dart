import 'package:flutter/services.dart';

class NotificationChannel {
  static const platform = MethodChannel('com.example.remind_me/notifications');

  static Future<void> showNotification(String taskTitle, String taskDescription) async {
    try {
      await platform.invokeMethod('showNotification', {
        'taskTitle': taskTitle,
        'taskDescription': taskDescription,
      });
    } on PlatformException catch (e) {
      print("Failed to show notification: '${e.message}'.");
    }
  }

  static Future<void> provideHapticFeedback() async {
    try {
      await platform.invokeMethod('provideHapticFeedback');
    } on PlatformException catch (e) {
      print("Failed to provide haptic feedback: '${e.message}'.");
    }
  }
}
