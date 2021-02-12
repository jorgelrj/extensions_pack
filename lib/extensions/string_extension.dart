extension StringExtension on String {
  bool get isBlank => this == null || isEmpty;
  bool get isNotBlank => !isBlank;

  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';

  String toSnakeCase() {
    return replaceAllMapped(RegExp('(?<=[a-z])[A-Z]'), (Match m) {
      return '_${m.group(0)}';
    }).toLowerCase();
  }

  String removeExtraWhiteSpace() => replaceAll(RegExp(r'\\s+'), ' ');
}
