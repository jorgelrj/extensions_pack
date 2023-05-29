extension IntEPExtension on int {
  Duration asDays() => Duration(days: this);
  Duration asHours() => Duration(hours: this);
  Duration asMinutes() => Duration(minutes: this);
  Duration asSeconds() => Duration(seconds: this);
  Duration asMilliseconds() => Duration(milliseconds: this);
}
