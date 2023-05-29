import 'package:flutter/material.dart';

class ListValidator {
  static FormFieldValidator<List> notEmpty([String? message]) {
    return (List? value) {
      if (value == null || value.isEmpty) {
        return message ?? 'This field is required';
      }

      return null;
    };
  }

  static FormFieldValidator<List> anyIsValid(List<FormFieldValidator<List>> validators) {
    return (List? value) {
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
}
