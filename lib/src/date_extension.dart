extension DateEPExtension on DateTime {
  DateTime get endOfDay {
    return startOfDay.add(const Duration(days: 1)).subtract(const Duration(milliseconds: 1));
  }

  DateTime get startOfDay => DateTime(year, month, day);

  bool get isToday => startOfDay == DateTime.now().startOfDay;
  bool get isTomorrow => startOfDay == DateTime.now().startOfDay.addDays(1);

  bool get isWeekend {
    return weekday == DateTime.sunday || weekday == DateTime.saturday;
  }

  DateTime get beginningOfMonth => DateTime(year, month);

  bool isBetween(DateTime start, DateTime finish) {
    return isAfter(start) && isBefore(finish);
  }

  bool isSameOrAfter(DateTime date) => isAtSameMomentAs(date) || isAfter(date);
  bool isSameOrBefore(DateTime date) => isAtSameMomentAs(date) || isBefore(date);

  DateTime addDays(int days) => add(Duration(days: days));
  DateTime subtractDays(int days) => subtract(Duration(days: days));

  DateTime operator +(Duration duration) => add(duration);
  DateTime operator -(Duration duration) => subtract(duration);

  /// Returns date as the first day of the next month
  DateTime addMonths(int months) {
    final finalMonth = month + months;

    return DateTime(
      year + (finalMonth > 12 ? finalMonth ~/ 12 : 0),
      finalMonth > 12 ? finalMonth % 12 : finalMonth,
    );
  }

  int differenceInDays(DateTime date) => difference(date).inDays;

  bool get isLeapYear {
    bool leapYear = false;

    bool leap = ((year % 100 == 0) && (year % 400 != 0));
    if (leap == true)
      leapYear = false;
    else if (year % 4 == 0) leapYear = true;

    return leapYear;
  }

  int get daysInMonth {
    switch (month) {
      case 2:
        return isLeapYear ? 29 : 28;
      case 4:
      case 6:
      case 9:
      case 11:
        return 30;
      case 1:
      case 3:
      case 5:
      case 7:
      case 8:
      case 10:
      case 12:
        return 31;
      default:
        return 0;
    }
  }

  DateTime get sundayBefore {
    DateTime sunday = this;
    while (sunday.weekday != DateTime.sunday) {
      sunday = sunday.subtractDays(1);
    }
    return sunday.startOfDay;
  }

  int get weekDayBaseSunday {
    switch (weekday) {
      case DateTime.sunday:
        return 0;
      case DateTime.monday:
        return 1;
      case DateTime.tuesday:
        return 2;
      case DateTime.wednesday:
        return 3;
      case DateTime.thursday:
        return 4;
      case DateTime.friday:
        return 5;
      default:
        return 6;
    }
  }

  bool isSameDayAs(DateTime date) {
    return day == date.day && month == date.month && year == date.year;
  }

  bool get isLastDayOfMonth => day == daysInMonth;
}
