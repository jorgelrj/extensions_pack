extension IntExtension on int {
  Duration asSeconds() => Duration(seconds: this);
  Duration asMilliseconds() => Duration(milliseconds: this);
}
