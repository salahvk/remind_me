import 'package:flutter/services.dart';
import 'package:remind_me/config/method_channel/channel.dart';

class DateTimePickerService {
  static const platform = MethodChannel(RemindMeChannels.dateTimeChannel);

  // Function to call the native Date Picker
  Future<String?> showDatePicker() async {
    try {
      final String? selectedDate =
          await platform.invokeMethod(RemindMeChannelMethods.showDatePicker);
      return selectedDate;
    } on PlatformException catch (e) {
      return "Error: ${e.message}";
    }
  }

  // Function to call the native Time Picker
  Future<String?> showTimePicker() async {
    try {
      final String? selectedTime =
          await platform.invokeMethod(RemindMeChannelMethods.showTimePicker);
      return selectedTime;
    } on PlatformException catch (e) {
      return "Error: ${e.message}";
    }
  }

}
