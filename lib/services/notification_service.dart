import 'package:flutter/services.dart';
import 'package:remind_me/config/method_channel/channel.dart';

class NativeNotificationService {
  static const _channel = MethodChannel(RemindMeChannels.notificationChannel);

  static Future<void> scheduleNotification(
      String taskId, String title, String description, DateTime time) async {
    final timeMillis = time.millisecondsSinceEpoch;
    await _channel.invokeMethod(RemindMeChannelMethods.scheduleNotification, {
      'taskId': taskId,
      'title': title,
      'description': description,
      'timeMillis': timeMillis,
    });
  }
}
