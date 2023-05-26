import 'dart:convert';

extension ListEPExtension<T> on List<T> {
  void addBetween(value) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, value);
    }
  }

  String toJSON() => jsonEncode(this);

  List<T>? addListIf(bool condition) {
    return condition ? this : null;
  }

  void addToListIf(T item, bool condition) {
    if (condition) add(item);
  }

  void replaceWhere(T value, bool Function(T) compareFn) {
    final index = indexWhere(compareFn);

    if (index == -1) return;

    _exchangeAtIndex(index, value);
  }

  void replace(T value) {
    final index = indexOf(value);

    if (index == -1) return;

    _exchangeAtIndex(index, value);
  }

  void _exchangeAtIndex(int index, T value) {
    removeAt(index);
    insert(index, value);
  }
}
