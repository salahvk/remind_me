import 'package:flutter/services.dart';

class DateTimePickerService {
  static const platform = MethodChannel('com.example.remind_me/datePicker');

  // Function to call the native Date Picker
  Future<String?> showDatePicker() async {
    try {
      // Invoke the method to show the Date Picker dialog
      await platform.invokeMethod('showDatePicker');
      return null;  // You could return the date here if needed, but this will handle UI
    } on PlatformException catch (e) {
      print("Failed to show DatePicker: '${e.message}'.");
      return "Error: ${e.message}";
    }
  }

  // Function to call the native Time Picker
  Future<String?> showTimePicker() async {
    try {
      // Invoke the method to show the Time Picker dialog
      await platform.invokeMethod('showTimePicker');
      return null;  // Similar to DatePicker, this can be handled via UI or callback
    } on PlatformException catch (e) {
      print("Failed to show TimePicker: '${e.message}'.");
      return "Error: ${e.message}";
    }
  }

  // Listen for the selected date or time, can be set in your app's initState or elsewhere
  static Future<String?> getPickedDateOrTime(MethodCall call) async {
    if (call.method == "onDatePicked") {
      return call.arguments;
    } else if (call.method == "onTimePicked") {
      return call.arguments;
    } else {
      return null;
    }
  }
}
