import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';

class StringValidator {
  static FormFieldValidator<String> notEmpty([String? message]) {
    return (String? value) {
      if (value.isBlank) {
        return message ?? 'This field is required';
      }

      return null;
    };
  }

  static FormFieldValidator<String> maxLength(int length, [String? message]) {
    return (String? value) {
      if ((value?.length ?? 0) > length) {
        return message ?? 'This field must be less than $length characters';
      }

      return null;
    };
  }

  static FormFieldValidator<String> minLength(
    int length, {
    bool cleanMask = false,
    String? message,
  }) {
    return (String? value) {
      String? _value = value;
      if (cleanMask && _value.isNotBlank) {
        _value = StringUtils.cleanMask(value!);
      }

      if ((value?.length ?? 0) < length) {
        return message ?? 'This field must be more than $length characters';
      }

      return null;
    };
  }

  static FormFieldValidator<String> minMaxLength(int minLength, int maxLength, [String? message]) {
    return (String? value) {
      if ((value?.length ?? 0) < minLength || (value?.length ?? 0) > maxLength) {
        return message ?? 'This field must be between $minLength and $maxLength characters';
      }

      return null;
    };
  }

  static FormFieldValidator<String> chain(List<FormFieldValidator<String>> validators) {
    return (String? value) {
      for (final validator in validators) {
        final error = validator(value);
        if (error != null) {
          return error;
        }
      }

      return null;
    };
  }

  static FormFieldValidator<String> email([String? message]) {
    return (String? value) {
      const pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      final regExp = RegExp(pattern);

      if (!regExp.hasMatch(value ?? '')) {
        return message ?? 'Email is not valid';
      }

      return null;
    };
  }
}
