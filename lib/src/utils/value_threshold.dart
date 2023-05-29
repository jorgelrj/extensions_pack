class ValueThreshold {
  final num _min;
  final num _max;

  const ValueThreshold(
    num? min,
    num? max,
  )   : assert(min != null || max != null),
        _min = min ?? 0,
        _max = max ?? double.infinity;

  num get min => _min;
  num get max => _max;

  bool contains(double value) {
    return value >= _min && value <= _max;
  }

  num get average {
    if (_max.isInfinite) return _min;

    return ((_min) + _max) / 2;
  }

  ValueThreshold clampNegatives() {
    return ValueThreshold(
      _min < 0 ? 0 : _min,
      _max < 0 ? 0 : _max,
    );
  }
}
