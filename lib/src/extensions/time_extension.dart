import 'package:flutter/material.dart';

extension TimeOfDayEPExtension on TimeOfDay {
  DateTime toDate() => DateTime(1, 1, 1, hour, minute);

  int inMinutes() => (hour * 60) + minute;

  /// Returns value as time string with timezone. Ex: 13:25-03
  String toStringWithGMT() {
    final timeString = toFormattedString();
    final timezoneOffset = DateTime.now().timeZoneOffset;
    final hourOffset =
        '${timezoneOffset.isNegative ? '-' : '+'}${_addLeadingZeroIfNeeded(
      timezoneOffset.inHours.abs(),
    )}';
    return '$timeString$hourOffset';
  }

  /// Returns value as time string. Ex: 13:25
  String toFormattedString() {
    return '${_addLeadingZeroIfNeeded(hour)}:${_addLeadingZeroIfNeeded(minute)}';
  }
}

String _addLeadingZeroIfNeeded(int value) {
  if (value < 10) return '0$value';
  return value.toString();
}
