import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';

extension WidgetEPExtension on Widget {
  Widget padded([EdgeInsets padding = const EdgeInsets.all(kXSSize)]) {
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

  Widget positioned({
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: this,
    );
  }
}

extension ListWidgetEPExtension on List<Widget> {
  List<Widget> flexed() {
    return [for (final widget in this) Flexible(child: widget)];
  }

  List<Widget> expanded() {
    return [for (final widget in this) Expanded(child: widget)];
  }

  List<Widget> addSpacingBetween({
    double mainAxisSpacing = kXSSize,
    double? crossAxisSpacing,
  }) {
    return this
      ..addBetween(
        Spacing(
          mainAxisSpacing,
          crossAxisExtent: crossAxisSpacing,
        ),
      );
  }
}
