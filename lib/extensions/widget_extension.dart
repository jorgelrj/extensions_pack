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

  Widget constrained({
    double maxHeight,
    double maxWidth,
    double minHeight,
    double minWidth,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        minHeight: minHeight,
        minWidth: minWidth,
      ),
      child: this,
    );
  }

  Widget centered() => Center(child: this);

  Widget aligned([Alignment alignment = Alignment.center]) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }
}
