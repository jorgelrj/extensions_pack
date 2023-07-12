import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recase/recase.dart';
import 'package:url_launcher/url_launcher_string.dart';

extension StringEPExtension on String {
  Future<void> launch() async => launchUrlString(this);

  bool get isUrl => startsWith('https://') || startsWith('http://');

  String capitalize() {
    return isBlank ? '' : '${this[0].toUpperCase()}${substring(1)}';
  }

  String capitalizeAllFirst() {
    return split(' ').map((e) => e.toLowerCase().capitalize()).join(' ');
  }

  String toSnakeCase() => snakeCase;

  String toCamelCase() => camelCase;

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

  DateTime? toDateTime([String? pattern]) {
    if (pattern == null) {
      return DateTime.tryParse(this);
    } else {
      try {
        return DateFormat(pattern).parse(this);
      } catch (_) {
        return null;
      }
    }
  }

  List<String> toList([Pattern pattern = '']) => split(pattern);

  dynamic parseJSON() => jsonDecode(this);

  int? toInt() => int.tryParse(this);

  double? toDouble() => double.tryParse(this);

  bool toBool() => this == 'true';

  Text toText({
    TextStyle? style,
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
    TextOverflow? textOverflow,
    bool? softWrap,
    TextDecoration? textDecoration,
  }) {
    return Text(
      this,
      textAlign: textAlign,
      overflow: textOverflow,
      softWrap: softWrap,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            color: color,
            decoration: textDecoration,
          ),
    );
  }

  SelectableText toSelectableText({
    TextStyle? style,
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    Color? color,
    TextDecoration? textDecoration,
  }) {
    return SelectableText(
      this,
      textAlign: textAlign,
      style: style ??
          TextStyle(
            fontSize: fontSize,
            fontFamily: fontFamily,
            fontWeight: fontWeight,
            color: color,
            decoration: textDecoration,
          ),
    );
  }
}

extension NullStringEPExtension on String? {
  bool get isBlank => this == null || this!.isEmpty;
  bool get isNotBlank => !isBlank;

  /// Returns value between 1 and 0. The greater the value,
  /// the greater similarity between the strings
  double similarityTo(String? compare) {
    // if both are null
    if (isBlank && compare.isBlank) {
      return 1;
    }
    // as both are not null if one of them is null then return 0
    if (isBlank || compare.isBlank) {
      return 0;
    }

    final original = this!.replaceAll(RegExp(r'\s+\b|\b\s'), ''); // remove all whitespace
    compare = compare!.replaceAll(RegExp(r'\s+\b|\b\s'), ''); // remove all whitespace

    // identical
    if (original == compare) {
      return 1;
    }
    // both are 1-letter strings
    if (original.length == 1 && compare.length == 1) {
      return 0;
    }
    // if either is a 1-letter string
    if (original.length < 2 || compare.length < 2) {
      return 0;
    }

    final firstBigrams = <String, int>{};
    for (var i = 0; i < original.length - 1; i++) {
      final bigram = original.substring(i, i + 2);
      final count = firstBigrams.containsKey(bigram) ? firstBigrams[bigram]! + 1 : 1;
      firstBigrams[bigram] = count;
    }

    var intersectionSize = 0;
    for (var i = 0; i < compare.length - 1; i++) {
      final bigram = compare.substring(i, i + 2);
      final count = firstBigrams.containsKey(bigram) ? firstBigrams[bigram]! : 0;

      if (count > 0) {
        firstBigrams[bigram] = count - 1;
        intersectionSize++;
      }
    }

    return (2.0 * intersectionSize) / (original.length + compare.length - 2);
  }
}
