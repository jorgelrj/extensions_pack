import 'package:flutter/material.dart';

class CommonValidator {
  static FormFieldValidator notNull([String? message]) {
    return (value) {
      if (value == null) {
        return message ?? 'This field is required';
      }

      return null;
    };
  }

  static FormFieldValidator chain(List<FormFieldValidator> validators) {
    return (value) {
      for (final validator in validators) {
        final error = validator(value);

        if (error != null) {
          return error;
        }
      }

      return null;
    };
  }

  static FormFieldValidator anyIsValid(List<FormFieldValidator> validators) {
    return (value) {
      bool isValid = false;
      String? error;
      for (final validator in validators) {
        error = validator(value);
        if (error == null) {
          isValid = true;
          break;
        }
      }

      return isValid ? null : error;
    };
  }

  static FormFieldValidator one(List<FormFieldValidator> validators) {
    return (value) {
      String? error;

      for (final validator in validators) {
        error = validator(value);
      }

      return error;
    };
  }
}
