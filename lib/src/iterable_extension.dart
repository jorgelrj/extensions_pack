extension NullIterableExtension<T> on Iterable<T>? {
  bool get isBlank => this == null || this!.isEmpty;
  bool get isNotBlank => !isBlank;

  T? get firsOrNull => isBlank ? null : this!.first;
  T? get lastOrNull => isBlank ? null : this!.last;

  T? firstWhereOrNull(bool Function(T) compareFn) {
    if (this == null) return null;
    final results = this!.where(compareFn);
    return results.firsOrNull;
  }

  int count() => isBlank ? 0 : this!.length;
}
