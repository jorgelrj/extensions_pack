import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Spacing extends StatelessWidget {
  const Spacing(
    this.mainAxisExtent, {
    Key? key,
    this.crossAxisExtent,
    this.color,
  })  : assert(mainAxisExtent >= 0 && mainAxisExtent < double.infinity),
        assert(crossAxisExtent == null || crossAxisExtent >= 0),
        super(key: key);

  const Spacing.expand(
    double mainAxisExtent, {
    Key? key,
    Color? color,
  }) : this(
          mainAxisExtent,
          key: key,
          crossAxisExtent: double.infinity,
          color: color,
        );

  final double mainAxisExtent;

  final double? crossAxisExtent;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ScrollableState? scrollableState = Scrollable.maybeOf(context);
    final AxisDirection? axisDirection = scrollableState?.axisDirection;
    final Axis? fallbackDirection = axisDirection == null ? null : axisDirectionToAxis(axisDirection);

    return _RawSpacing(
      mainAxisExtent,
      crossAxisExtent: crossAxisExtent,
      color: color,
      fallbackDirection: fallbackDirection,
    );
  }
}

class MaxSpacing extends StatelessWidget {
  const MaxSpacing(
    this.mainAxisExtent, {
    Key? key,
    this.crossAxisExtent,
    this.color,
  }) : super(key: key);

  const MaxSpacing.expand(
    double mainAxisExtent, {
    Key? key,
    Color? color,
  }) : this(
          mainAxisExtent,
          key: key,
          crossAxisExtent: double.infinity,
          color: color,
        );

  final double mainAxisExtent;

  final double? crossAxisExtent;

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: _RawSpacing(
        mainAxisExtent,
        crossAxisExtent: crossAxisExtent,
        color: color,
      ),
    );
  }
}

class _RawSpacing extends LeafRenderObjectWidget {
  const _RawSpacing(
    this.mainAxisExtent, {
    Key? key,
    this.crossAxisExtent,
    this.color,
    this.fallbackDirection,
  })  : assert(mainAxisExtent >= 0 && mainAxisExtent < double.infinity),
        assert(crossAxisExtent == null || crossAxisExtent >= 0),
        super(key: key);

  final double mainAxisExtent;

  final double? crossAxisExtent;

  final Color? color;

  final Axis? fallbackDirection;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _RenderSpacing(
      mainAxisExtent: mainAxisExtent,
      crossAxisExtent: crossAxisExtent ?? 0,
      color: color,
      fallbackDirection: fallbackDirection,
    );
  }

  @override
  void updateRenderObject(BuildContext context, _RenderSpacing renderObject) {
    renderObject
      ..mainAxisExtent = mainAxisExtent
      ..crossAxisExtent = crossAxisExtent ?? 0
      ..color = color
      ..fallbackDirection = fallbackDirection;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('mainAxisExtent', mainAxisExtent));
    properties.add(DoubleProperty('crossAxisExtent', crossAxisExtent, defaultValue: 0));
    properties.add(ColorProperty('color', color));
    properties.add(EnumProperty<Axis>('fallbackDirection', fallbackDirection));
  }
}

class _RenderSpacing extends RenderBox {
  _RenderSpacing({
    required double mainAxisExtent,
    double? crossAxisExtent,
    Axis? fallbackDirection,
    Color? color,
  })  : _mainAxisExtent = mainAxisExtent,
        _crossAxisExtent = crossAxisExtent,
        _color = color,
        _fallbackDirection = fallbackDirection;

  double get mainAxisExtent => _mainAxisExtent;
  double _mainAxisExtent;
  set mainAxisExtent(double value) {
    if (_mainAxisExtent != value) {
      _mainAxisExtent = value;
      markNeedsLayout();
    }
  }

  double? get crossAxisExtent => _crossAxisExtent;
  double? _crossAxisExtent;
  set crossAxisExtent(double? value) {
    if (_crossAxisExtent != value) {
      _crossAxisExtent = value;
      markNeedsLayout();
    }
  }

  Axis? get fallbackDirection => _fallbackDirection;
  Axis? _fallbackDirection;
  set fallbackDirection(Axis? value) {
    if (_fallbackDirection != value) {
      _fallbackDirection = value;
      markNeedsLayout();
    }
  }

  Axis? get _direction {
    final AbstractNode? parentNode = parent;
    if (parentNode is RenderFlex) {
      return parentNode.direction;
    } else {
      return fallbackDirection;
    }
  }

  Color? get color => _color;
  Color? _color;
  set color(Color? value) {
    if (_color != value) {
      _color = value;
      markNeedsPaint();
    }
  }

  @override
  double computeMinIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(
      Axis.horizontal,
      () => super.computeMinIntrinsicWidth(height),
    )!;
  }

  @override
  double computeMaxIntrinsicWidth(double height) {
    return _computeIntrinsicExtent(
      Axis.horizontal,
      () => super.computeMaxIntrinsicWidth(height),
    )!;
  }

  @override
  double computeMinIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(
      Axis.vertical,
      () => super.computeMinIntrinsicHeight(width),
    )!;
  }

  @override
  double computeMaxIntrinsicHeight(double width) {
    return _computeIntrinsicExtent(
      Axis.vertical,
      () => super.computeMaxIntrinsicHeight(width),
    )!;
  }

  double? _computeIntrinsicExtent(Axis axis, double Function() compute) {
    final Axis? direction = _direction;
    if (direction == axis) {
      return _mainAxisExtent;
    } else {
      if (_crossAxisExtent!.isFinite) {
        return _crossAxisExtent;
      } else {
        return compute();
      }
    }
  }

  @override
  Size computeDryLayout(BoxConstraints constraints) {
    final Axis? direction = _direction;

    if (direction != null) {
      if (direction == Axis.horizontal) {
        return constraints.constrain(Size(mainAxisExtent, crossAxisExtent!));
      } else {
        return constraints.constrain(Size(crossAxisExtent!, mainAxisExtent));
      }
    } else {
      throw FlutterError(
        'A Spacing widget must be placed directly inside a Flex widget '
        'or its fallbackDirection must not be null',
      );
    }
  }

  @override
  void performLayout() {
    size = computeDryLayout(constraints);
  }

  @override
  void paint(PaintingContext context, Offset offset) {
    if (color != null) {
      final Paint paint = Paint()..color = color!;
      context.canvas.drawRect(offset & size, paint);
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('mainAxisExtent', mainAxisExtent));
    properties.add(DoubleProperty('crossAxisExtent', crossAxisExtent));
    properties.add(ColorProperty('color', color));
    properties.add(EnumProperty<Axis>('fallbackDirection', fallbackDirection));
  }
}
