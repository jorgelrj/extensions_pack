extension DoubleEPExtension on double {
  String toFormattedString({int characters = 1}) {
    return toStringAsFixed(
      truncateToDouble() == this ? 0 : characters,
    );
  }
}
