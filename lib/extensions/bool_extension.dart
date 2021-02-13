extension BoolExtension on bool {
  bool get not => !this;

  bool fromString(String value) => value.toLowerCase() == 'true';
}
