//create by :xs
//day by2020/6/2.
//describe:封装一些常用的间距
import 'package:flutter/material.dart';
import 'package:gzldtechnology/utils/screen_adapter.dart';

class Sps{
  /// 水平间隔
  static const Widget hGap4 = const SizedBox(width: 4.0);
  static const Widget hGap8 = const SizedBox(width: 8.0);
  static const Widget hGap12 = const SizedBox(width: 12.0);
  ///垂直间隔

  static const Widget vGap4 = const SizedBox(height: 4.0);
  static const Widget vGap8= const SizedBox(height: 8.0,);


  static Widget hPure660  =     Container(
    alignment: Alignment.center,
    height: ScreenAdapter.height(2),
    width: ScreenAdapter.width(660),
    color: Color(0xFFF2F4F5),
  );

}