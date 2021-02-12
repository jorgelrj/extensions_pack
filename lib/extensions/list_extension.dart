extension ListExtension<V> on List<V> {
  bool get isBlank => this == null || isEmpty;
  bool get isNotBlank => !isBlank;

  void addBetween(V value) {
    for (int i = length - 1; i > 0; i--) {
      insert(i, value);
    }
  }
}
