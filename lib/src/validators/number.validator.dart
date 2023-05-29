import 'package:flutter/cupertino.dart';

class NumberValidator {
  static FormFieldValidator<num> isBetween(num min, num max, {String? message}) {
    return (value) {
      if (value == null) {
        return null;
      }

      if (value < min || value > max) {
        return message ?? 'Value must be between $min and $max';
      }

      return null;
    };
  }

  static FormFieldValidator<num> notNull([String? message]) {
    return (value) {
      if (value == null) {
        return message ?? 'Value must not be null';
      }

      return null;
    };
  }

  static FormFieldValidator<num> chain(List<FormFieldValidator<num>> validators) {
    return (value) {
      for (var validator in validators) {
        var error = validator(value);
        if (error != null) {
          return error;
        }
      }

      return null;
    };
  }
}
