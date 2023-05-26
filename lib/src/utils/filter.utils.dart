typedef PredicateFn<T> = bool Function(T value);

PredicateFn<T> or<T>(List<PredicateFn<T>> predicates) {
  return (T value) => predicates.any((predicate) => predicate(value));
}

PredicateFn<T> and<T>(List<PredicateFn<T>> predicates) {
  return (T value) => predicates.every((predicate) => predicate(value));
}

PredicateFn<T> not<T>(List<PredicateFn<T>> predicates) {
  return (T value) => predicates.every((predicate) => !predicate(value));
}
