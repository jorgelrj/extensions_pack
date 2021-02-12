import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorTheme => Theme.of(this).colorScheme;
}
