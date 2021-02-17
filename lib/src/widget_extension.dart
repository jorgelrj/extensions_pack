import 'package:flutter/widgets.dart';

extension WidgetExtension on Widget {
  Widget padded([EdgeInsets padding = const EdgeInsets.all(16)]) {
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
  Widget responsiveLayout() {
    assert(this.length == 2);

    return LayoutBuilder(
      builder: (context, constraints) {
        return constraints.maxWidth > 800 ? this.first : this.last;
      },
    );
  }
}
