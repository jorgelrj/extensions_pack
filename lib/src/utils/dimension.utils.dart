import 'package:extensions_pack/src/widgets/spacing.dart';
import 'package:flutter/material.dart';

const double kGridSpacer = 8.0;
const double kAppDefaultElevation = 8;
const double kAppDefaultBorderRadius = kGridSpacer;
const double kXXSSize = kGridSpacer / 2;
const double kXSSize = kGridSpacer * 2;
const double kSMSize = kGridSpacer * 3;
const double kMDSize = kGridSpacer * 4;
const double kLGSize = kGridSpacer * 5;
const double kXLSize = kGridSpacer * 6;
const double kXXLSize = kGridSpacer * 8;
const kBottomContentSpacing = Spacing(160);

DimensionUtils kSpacer = DimensionUtils(kGridSpacer);

class DimensionSide {
  final double spacer;
  final SidesFlag sidesFlag;

  const DimensionSide(this.spacer, this.sidesFlag);

  EdgeInsets get none => DimensionSize(spacer, sidesFlag, 0).data;
  EdgeInsets get xxs => DimensionSize(spacer, sidesFlag, 1).data;
  EdgeInsets get xs => DimensionSize(spacer, sidesFlag, 2).data;
  EdgeInsets get sm => DimensionSize(spacer, sidesFlag, 3).data;
  EdgeInsets get md => DimensionSize(spacer, sidesFlag, 4).data;
  EdgeInsets get lg => DimensionSize(spacer, sidesFlag, 5).data;
  EdgeInsets get xl => DimensionSize(spacer, sidesFlag, 6).data;
  EdgeInsets get xxl => DimensionSize(spacer, sidesFlag, 7).data;
  EdgeInsets value(double factor) => DimensionSize(spacer, sidesFlag, factor).data;
}

class DimensionSize {
  double spacer;
  SidesFlag sidesFlag;
  double factor;

  DimensionSize(this.spacer, this.sidesFlag, this.factor);

  EdgeInsets get data {
    return EdgeInsets.fromLTRB(
      sidesFlag.leftFlag * spacer * factor,
      sidesFlag.topFlag * spacer * factor,
      sidesFlag.rightFlag * spacer * factor,
      sidesFlag.bottomFlag * spacer * factor,
    );
  }
}

class DimensionUtils {
  late DimensionSide left;
  late DimensionSide top;
  late DimensionSide right;
  late DimensionSide bottom;
  late DimensionSide x;
  late DimensionSide y;
  late DimensionSide all;

  DimensionUtils(double spacerValue) {
    left = DimensionSide(spacerValue, SidesFlag(1, 0, 0, 0));
    top = DimensionSide(spacerValue, SidesFlag(0, 1, 0, 0));
    right = DimensionSide(spacerValue, SidesFlag(0, 0, 1, 0));
    bottom = DimensionSide(spacerValue, SidesFlag(0, 0, 0, 1));
    x = DimensionSide(spacerValue, SidesFlag(1, 0, 1, 0));
    y = DimensionSide(spacerValue, SidesFlag(0, 1, 0, 1));
    all = DimensionSide(spacerValue, SidesFlag(1, 1, 1, 1));
  }
}

class SidesFlag {
  double leftFlag = 0;
  double topFlag = 0;
  double rightFlag = 0;
  double bottomFlag = 0;

  SidesFlag(this.leftFlag, this.topFlag, this.rightFlag, this.bottomFlag);
}
