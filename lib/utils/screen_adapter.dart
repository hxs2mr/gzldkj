import 'package:flutter_screenutil/flutter_screenutil.dart';

//create by :xs
//day by2020/6/2.
//describe: 屏幕适配类
class ScreenAdapter{
  /// 初始化屏幕适配
  static init(context){
    ScreenUtil.init(context,width: 750,height: 1334);
  }
  static height(double value){
    return ScreenUtil().setHeight(value);
  }
  static width(double value){
    return ScreenUtil().setWidth(value);
  }
  static getScreenHeight(){
    return ScreenUtil.screenHeightDp;
  }
  static getScreenWidth(){
    return ScreenUtil.screenWidthDp;
  }
  static getScreenPxHeight(){
    return ScreenUtil.screenHeight;
  }
  static getScreenPxWidth(){
    return ScreenUtil.screenWidth;
  }

  static setSize(double value){
    return ScreenUtil().setSp(value);
  }
}