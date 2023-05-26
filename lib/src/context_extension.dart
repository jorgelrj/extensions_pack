import 'package:flutter/material.dart';

extension ContextEPExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  void pop() => Navigator.of(this).pop();
  Future<void> maybePop() => Navigator.of(this).maybePop();
}
