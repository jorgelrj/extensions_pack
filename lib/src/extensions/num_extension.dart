extension NullNumEPExtension on num? {
  bool get isBlank => this == null || this == 0 || this == 0.0;
  bool get isNotBlank => !isBlank;
}
