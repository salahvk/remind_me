import 'dart:io';

import 'package:flutter/services.dart';
import 'package:remind_me/config/method_channel/channel.dart';

class DateTimePickerService {
  static const androidChannel = MethodChannel(AndroidChannels.dateTimeChannel);
  static const iosChannel = MethodChannel(IOSChannels.dateTimeChannel);

  Future<String?> showDatePicker() async {
    final channel = Platform.isAndroid ? androidChannel : iosChannel;
    try {
      final String? selectedDate =
          await channel.invokeMethod(RemindMeChannelMethods.showDatePicker);
      return selectedDate;
    } on PlatformException catch (e) {
      return "Error: ${e.message}";
    }
  }

  Future<String?> showTimePicker() async {
    final channel = Platform.isAndroid ? androidChannel : iosChannel;
    try {
      final String? selectedTime =
          await channel.invokeMethod(RemindMeChannelMethods.showTimePicker);
      return selectedTime;
    } on PlatformException catch (e) {
      return "Error: ${e.message}";
    }
  }
}
