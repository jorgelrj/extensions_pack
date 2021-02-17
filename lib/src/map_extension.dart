extension MapExtension<A, B> on Map<A, B> {
  T? getKey<T>(A key) => containsKey(key) ? this[key] as T : null;
}

extension NullMapExtension<A, B> on Map<A, B>? {
  bool get isBlank => this == null || this!.isEmpty;
  bool get isNotBlank => !isBlank;
}
