import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget padded([EdgeInsets padding = const EdgeInsets.all(16.0)]) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget sized({double? height, double? width}) {
    return SizedBox(
      height: height,
      width: width,
      child: this,
    );
  }

  Widget constrained({
    double maxHeight = double.infinity,
    double maxWidth = double.infinity,
    double minHeight = 0.0,
    double minWidth = 0.0,
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

  Widget bordered({
    bool top = true,
    bool bottom = true,
    bool left = true,
    bool right = true,
    Color color = Colors.black12,
    double radius = 4.0,
  }) {
    final border = BorderSide(color: color);

    return Container(
      decoration: BoxDecoration(
        borderRadius: top && bottom && left && right
            ? BorderRadius.all(Radius.circular(radius))
            : null,
        border: Border(
          top: top ? border : BorderSide.none,
          bottom: bottom ? border : BorderSide.none,
          left: left ? border : BorderSide.none,
          right: right ? border : BorderSide.none,
        ),
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

extension ListWidgetExtension on List<Widget> {
  /// Returns first widget for wide screens and last for mobile
  Widget responsiveLayout({
    double mobileBreakPoint = 460,
    double tabletBreakPoint = 800,
    double webBreakPoint = 1400,
  }) {
    assert(length == 3 || length == 2);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= mobileBreakPoint) {
          return first;
        } else if (constraints.maxWidth > mobileBreakPoint &&
            constraints.maxWidth <= tabletBreakPoint) {
          return this[1];
        } else if (constraints.maxWidth > tabletBreakPoint &&
            constraints.maxWidth <= webBreakPoint) {
          return last;
        } else {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: webBreakPoint),
            child: Center(
              child: last,
            ),
          );
        }
      },
    );
  }
}
