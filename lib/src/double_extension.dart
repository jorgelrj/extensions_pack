extension DoubleEPExtension on double {
  String toFormattedString({int caracteres = 1}) {
    return this.toStringAsFixed(
      this.truncateToDouble() == this ? 0 : caracteres,
    );
  }
}
