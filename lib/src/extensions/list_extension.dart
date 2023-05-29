import 'dart:convert';

extension ListEPExtension<T> on List<T> {
  void addBetween(value) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, value);
    }
  }

  String toJSON() => jsonEncode(this);

  void addToListIf(T item, bool condition) {
    if (condition) add(item);
  }

  void replaceWhere(T value, bool Function(T) compareFn) {
    final index = indexWhere(compareFn);
    if (index == -1) {
      return;
    }

    this[index] = value;
  }
}
