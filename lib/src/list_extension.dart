import 'dart:convert';

extension ListExtension<T> on List<T> {
  void addBetween(value) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, value);
    }
  }

  String toJSON() => jsonEncode(this);
}
