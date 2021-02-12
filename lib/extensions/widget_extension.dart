import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget padded([EdgeInsets padding = const EdgeInsets.all(16)]) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget sized({double height, double width}) {
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }
}
