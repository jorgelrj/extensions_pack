import 'package:flutter/material.dart';

extension DateExtension on DateTime {
  DateTime get endOfDay {
    return startOfDay
        .add(const Duration(days: 1))
        .subtract(const Duration(milliseconds: 1));
  }

  DateTime get startOfDay => DateTime(year, month, day);

  bool get isToday => startOfDay == DateTime.now().startOfDay;

  bool get isWeekend {
    return weekday == DateTime.sunday || weekday == DateTime.saturday;
  }
}

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDate() => DateTime(1, 1, 1, hour, minute);
}

extension DurationExtension on Duration {
  Future<void> get delay => Future.delayed(this);
}
