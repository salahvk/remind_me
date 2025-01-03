import 'dart:io';

import 'package:flutter/services.dart';
import 'package:remind_me/config/method_channel/channel.dart';

class NativeNotificationService {
  static const androidChannel =
      MethodChannel(AndroidChannels.notificationChannel);
  static const iosChannel = MethodChannel(IOSChannels.notificationChannel);

  static Future<void> scheduleNotification(
      String taskId, String title, String description, DateTime time) async {
    final timeMillis = time.millisecondsSinceEpoch;
    final channel = Platform.isAndroid ? androidChannel : iosChannel;
    await channel.invokeMethod(RemindMeChannelMethods.scheduleNotification, {
      'taskId': taskId,
      'title': title,
      'description': description,
      'timeMillis': timeMillis,
    });
  }
}
