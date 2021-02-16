import 'package:flutter/material.dart';

extension StringExtension on String {
  bool get isBlank => this == null || isEmpty;
  bool get isNotBlank => !isBlank;

  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

  String toSnakeCase() {
    return replaceAllMapped(RegExp('(?<=[a-z])[A-Z]'), (Match m) {
      return '_${m.group(0)}';
    }).toLowerCase();
  }

  bool get isEmail {
    return RegExp(
      r"^[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?$",
      caseSensitive: false,
    ).hasMatch(this);
  }

  String removeExtraWhiteSpace() => replaceAll(RegExp(r'\\s+'), ' ');

  TimeOfDay toTimeOfDay() {
    final dateTime = DateTime.tryParse(this);
    return dateTime == null ? null : TimeOfDay.fromDateTime(dateTime);
  }

  DateTime toDateTime() => DateTime.tryParse(this);
}
