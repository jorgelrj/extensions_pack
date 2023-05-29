import 'package:flutter/material.dart';

extension ContextEPExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorTheme => Theme.of(this).colorScheme;

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  Future<void> maybePop<T extends Object?>([T? result]) {
    return Navigator.of(this).maybePop<T>(result);
  }

  Future<void> scrollToTop() async {
    Scrollable.maybeOf(this)?.position.animateTo(
          0,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
  }
}
