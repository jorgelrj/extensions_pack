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

  bool isBetween(DateTime start, DateTime finish) {
    return isAfter(start) && isBefore(finish);
  }

  bool isSameOrAfter(DateTime date) => isAtSameMomentAs(date) || isAfter(date);
  bool isSameOrBefor(DateTime date) => isAtSameMomentAs(date) || isBefore(date);

  DateTime addDays(int days) => add(Duration(days: days));
  DateTime subtractDays(int days) => subtract(Duration(days: days));
  DateTime addMonths(int months) => add(Duration(days: months * 30));
  DateTime subtractMonths(int months) => subtract(Duration(days: months * 30));
  DateTime addYears(int years) => add(Duration(days: years * 365));
  DateTime subtractYears(int years) => subtract(Duration(days: years * 365));

  int differenceInDays(DateTime date) => difference(date).inDays;
}

extension TimeOfDayExtension on TimeOfDay {
  DateTime toDate() => DateTime(1, 1, 1, hour, minute);

  int inMinutes() => (hour * 60) + minute;
}

extension DurationExtension on Duration {
  Future<void> get delay => Future.delayed(this);
}
