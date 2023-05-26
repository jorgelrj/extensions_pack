extension DurationEPExtension on Duration {
  Future<void> get delay => Future.delayed(this);
}
