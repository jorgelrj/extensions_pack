import 'dart:convert';

import 'package:flutter/material.dart';

extension StringExtension on String {
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

  TimeOfDay? toTimeOfDay() {
    final dateTime = toDateTime();
    return dateTime == null ? null : TimeOfDay.fromDateTime(dateTime);
  }

  DateTime? toDateTime() => DateTime.tryParse(this);

  List<String> toList() => split('');

  dynamic parseJSON() => jsonDecode(this);

  int? toInt() => int.tryParse(this);

  double? toDouble() => double.tryParse(this);

  Text toText({
    TextStyle? style,
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return Text(
      this,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            color: color,
          ),
    );
  }
}

extension NullStringExtension on String? {
  bool get isBlank => this == null || this!.isEmpty;
  bool get isNotBlank => !isBlank;
}
