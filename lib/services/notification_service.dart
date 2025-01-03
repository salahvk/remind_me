import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remind_me/config/method_channel/channel.dart';
import 'package:remind_me/features/task/presentation/bloc/task_bloc.dart';

class NativeNotificationService {
  static const androidChannel =
      MethodChannel(AndroidChannels.notificationChannel);
  static const iosChannel = MethodChannel(IOSChannels.notificationChannel);
  static const androidMarkdoneChannel =
      MethodChannel(AndroidChannels.notificationMarkAsDoneChannel);

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

  static Future<void> onMarkDoneNotifier(BuildContext context) async {
    if (Platform.isAndroid) {
      androidMarkdoneChannel.setMethodCallHandler((call) async {
        if (call.method == 'markAsDone') {
          final String taskId = call.arguments;
          // Handle the task ID
          debugPrint('Task ID: $taskId marked as done');
          context.read<TaskBloc>().add(TaskEvent.markTaskCompleted(taskId));
        }
      });
    }
  }
}
