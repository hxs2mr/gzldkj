import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gzldtechnology/utils/color.dart';
//create by :xs
//day by2020/6/3.
//describe:

enum TipType {
  loading,
  logo
}
class UndeFinedComponents extends StatelessWidget {
  const UndeFinedComponents({
    Key key,
    this.label = '网络断开!',
    this.flex = 1,
    this.textColor,
    this.centerWidget,
  }) : super(key: key);
  final String label;
  final int flex;
  final Color textColor;
  final Widget centerWidget;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            centerWidget == null ?
            new Image.asset(
                'assets/images/mine/undefined.png',
                width: ScreenUtil().setWidth(407.0),
                height: ScreenUtil().setHeight(289.0)
            ) : centerWidget,
            new Divider(color: Colors.transparent,height: ScreenUtil().setHeight(60.0),),
            new Text(
              label,
              style: TextStyle(
              //    fontFamily: FontFamily.fangzhengkatu,
                  fontSize: ScreenUtil().setSp(32.0),
                  color: textColor == null ? ColorR.home_active : textColor
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContainerTip extends StatelessWidget {

  ContainerTip({
    Key key,
    this.label = '加载中...',
    this.backgroundColor,
    this.height = 200.0,
    this.centerWidget,
    this.tipType = TipType.logo
  }) : super(key: key);

  final String label;
  final double height;
  final Color backgroundColor;
  final Widget centerWidget;
  final TipType tipType;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(height),
      color: backgroundColor == null? Colors.transparent : backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildLabelWidget(),
          SizedBox( width: ScreenUtil().setWidth(20.0), ),
          Text(
              label,
              style: TextStyle(
             //     fontFamily: FontFamily.fangzhengkatu,
                  color: ColorR.home_active
              )
          )
        ],
      ),
    );
  }

  ///文本label
  Widget _buildLabelWidget() {
    switch (tipType) {
      case TipType.logo:
        return centerWidget==null ?
        Image.asset(
          'assets/images/home/icon_home_logo.png',
          height: ScreenUtil().setHeight(47.0),
          width: ScreenUtil().setWidth(52.0),
        ) :
        centerWidget;
        break;
      case TipType.loading:
        return SpinKitDoubleBounce(
          color: ColorR.home_active,
          size: ScreenUtil().setSp(50.0),
        );
        break;
    }
    return Container();
  }
}