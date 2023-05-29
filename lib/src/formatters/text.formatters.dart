import 'dart:math' as math;

import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/services.dart';

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class CapitalizeCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.capitalize(),
      selection: newValue.selection,
    );
  }
}

class NumericalRangeTextFormatter extends TextInputFormatter {
  final num min;
  final num max;

  NumericalRangeTextFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final value = double.tryParse(newValue.text) ?? 0;

    if (newValue.text == '') {
      return newValue;
    } else if (value < min) {
      return const TextEditingValue().copyWith(text: min.toStringAsFixed(2));
    } else {
      return value > max ? oldValue : newValue;
    }
  }
}

class MaxLengthTextFormatter extends TextInputFormatter {
  final int maxLength;

  MaxLengthTextFormatter({required this.maxLength});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final int max = maxLength;
    final String value = newValue.text;

    if (value.length > max) {
      return oldValue;
    }

    return newValue;
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  final int? decimalRange;

  DecimalTextInputFormatter({this.decimalRange}) : assert(decimalRange == null || decimalRange > 0);

  bool _hasDecimal(String value) {
    return value.contains('.') || value.contains(',');
  }

  int _decimalIndex(String value) {
    return value.contains('.') ? value.indexOf('.') : value.indexOf(',');
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      final String value = newValue.text;

      if (_hasDecimal(value) && value.substring(_decimalIndex(value) + 1).length > decimalRange!) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == '.') {
        truncated = '0.';

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
      );
    }

    return newValue;
  }
}
