import 'package:flutter/services.dart';

class TaskReceiver {
  static const EventChannel _eventChannel =
      EventChannel('com.example.remind_me/mark_as_done');

  // Set up a listener to receive the broadcast
  static Stream<Map<String, dynamic>> get taskDoneStream {
    print("object");
    return _eventChannel.receiveBroadcastStream().map((event) {
      // Handle the event data here
      print("object");
      return Map<String, dynamic>.from(event);
    });
  }
}
