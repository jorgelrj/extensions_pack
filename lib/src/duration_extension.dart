extension DurationExtension on Duration {
  Future<void> get delay => Future.delayed(this);
}
