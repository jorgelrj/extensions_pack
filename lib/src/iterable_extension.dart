extension NullIterableExtension<T> on Iterable<T>? {
  bool get isBlank => this == null || this!.isEmpty;
  bool get isNotBlank => !isBlank;

  T? get firsOrNull => isBlank ? null : this!.first;
  T? get lastOrNull => isBlank ? null : this!.last;

  int count() => isBlank ? 0 : this!.length;
}
