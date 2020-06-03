//create by :xs
//day by2020/6/2.
//describe:
import 'package:flutter/material.dart';
import 'dart:math' as math;
class BottomLocation extends FloatlocationWidget {
  const BottomLocation();
  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = _endOffset(scaffoldGeometry);
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }

  @override
  String toString() => 'FloatingActionButtonLocation.endDocked';

  double _endOffset(ScaffoldPrelayoutGeometry scaffoldGeometry, { double offset = 0.0 }) {
    assert(scaffoldGeometry.textDirection != null);
    switch (scaffoldGeometry.textDirection) {
      case TextDirection.rtl:
        return _leftOffset(scaffoldGeometry, offset: offset);
      case TextDirection.ltr:
        return _rightOffset(scaffoldGeometry, offset: offset);
    }
    return null;
  }
  double _leftOffset(ScaffoldPrelayoutGeometry scaffoldGeometry, { double offset = 0.0 }) {
    return kFloatingActionButtonMargin
        + scaffoldGeometry.minInsets.left
        - offset;
  }

  double _rightOffset(ScaffoldPrelayoutGeometry scaffoldGeometry, { double offset = 0.0 }) {
    return scaffoldGeometry.scaffoldSize.width
        - kFloatingActionButtonMargin
        - scaffoldGeometry.minInsets.right
        - scaffoldGeometry.floatingActionButtonSize.width
        + offset;
  }
}

///按钮中间的位置 向下移动
abstract class FloatlocationWidget extends FloatingActionButtonLocation{

  const FloatlocationWidget();
  // Positions the Y coordinate of the [FloatingActionButton] at a height
  // where it docks to the [BottomAppBar].
  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double bottomSheetHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight / 2.0;
    // The FAB should sit with a margin between it and the snack bar.
    if (snackBarHeight > 0.0)
      fabY = math.min(fabY, contentBottom - snackBarHeight - fabHeight - kFloatingActionButtonMargin);
    // The FAB should sit with its center in front of the top of the bottom sheet.
    if (bottomSheetHeight > 0.0)
      fabY = math.min(fabY, contentBottom - bottomSheetHeight - fabHeight / 2.0);

    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return math.min(maxFabY, fabY)+18;
  }

}