import 'package:flutter/services.dart';

class TaskReceiver {
  static const EventChannel _eventChannel =
      EventChannel('com.example.remind_me/mark_as_done');

  // Listener to receive the broadcast
  static Stream<Map<String, dynamic>> get taskDoneStream {
    return _eventChannel.receiveBroadcastStream().map((event) {
      return Map<String, dynamic>.from(event);
    });
  }
}
