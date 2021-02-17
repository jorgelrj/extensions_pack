extension ListExtension<T> on List<T> {
  void addBetween(value) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, value);
    }
  }

  T? get nullOrFirst => isBlank ? null : first;
  T? get nullOrLast => isBlank ? null : last;
}

extension NullListExtension<T> on List<T>? {
  bool get isBlank => this == null || this!.isEmpty;
  bool get isNotBlank => !isBlank;
}
