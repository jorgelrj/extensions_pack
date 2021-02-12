extension MapExtension<A, B> on Map<A, B> {
  bool get isBlank => this == null || isEmpty;
  bool get isNotBlank => !isBlank;

  T getKey<T>(String key) {
    return this == null
        ? null
        : containsKey(key)
            ? this[key] as T
            : null;
  }
}
