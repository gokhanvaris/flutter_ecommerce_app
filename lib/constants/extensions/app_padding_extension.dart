import 'package:flutter/rendering.dart';

class AppPadding extends EdgeInsets {
  const AppPadding.smallAll() : super.all(10);
  const AppPadding.mediumAll() : super.all(15);
  const AppPadding.largeAll() : super.all(20);
  const AppPadding.xLargeAll() : super.all(30);
  const AppPadding.custom(
      {double? left,
      double? right,
      double? top,
      double? bottom})
      : super.only(
            left: left ?? 0,
            right: right ?? 0,
            top: top ?? 0,
            bottom: bottom ?? 0);
}
